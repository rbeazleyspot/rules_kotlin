load("@rules_java//java/common:java_info.bzl", "JavaInfo")
load("//kotlin:jvm.bzl", "kt_jvm_library")
load("//src/test/starlark:case.bzl", "Want", "suite")

def _java_compile_has_associate_jars_impl(env, target):
    """Verify the Javac action receives associate jars in its inputs.

    When java_common.compile() runs for mixed Kotlin/Java targets with associates,
    associate jars must be in the action's inputs so javac can resolve internal
    symbols referenced by generated code (e.g. Dagger components).

    compile.bzl creates synthetic JavaInfo(compile_jar=jar, neverlink=True) from
    compile_deps.associate_jars and adds them to java_common.compile() deps.
    The associate_jars contain compile_jars (ABI jars) with the default toolchain,
    or class_jars (full jars) when experimental_remove_private_classes_in_abi_jars
    is enabled — which is the scenario where this fix is essential.
    """
    got_target = env.expect.that_target(target)

    # java_common.compile() registers an action with mnemonic "Javac"
    javac_action = got_target.action_named("Javac")

    # With the default toolchain config, associate_jars contains the associate's
    # compile_jars (ABI jars). These are what compile.bzl wraps in synthetic
    # JavaInfos for java_common.compile().
    associate_target = env.ctx.attr.associate_target
    associate_jar_paths = [
        jar.short_path
        for jar in associate_target[JavaInfo].compile_jars.to_list()
    ]
    javac_action.inputs().contains_at_least(associate_jar_paths)

def _test_java_compile_has_associate_jars(test):
    """Mixed Kotlin/Java target with associates should pass associate jars to javac."""
    associate = test.have(
        kt_jvm_library,
        name = "associate_lib",
        srcs = [test.artifact("Internal.kt")],
    )

    got = test.got(
        kt_jvm_library,
        name = "main_lib",
        srcs = [
            test.artifact("Main.kt"),
            test.artifact("Generated.java"),
        ],
        associates = [associate],
    )

    test.claim(
        got = got,
        what = _java_compile_has_associate_jars_impl,
        wants = {
            "associate_target": Want(
                attr = attr.label(providers = [JavaInfo]),
                value = associate,
            ),
        },
    )

def test_suite(name):
    suite(
        name,
        test_java_compile_has_associate_jars = _test_java_compile_has_associate_jars,
    )
