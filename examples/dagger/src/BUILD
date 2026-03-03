load("@rules_java//java:java_binary.bzl", "java_binary")
load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

package(default_visibility = ["//visibility:private"])

# Generate a srcjar to validate intellij plugin correctly attaches it.
genrule(
    name = "tea_lib_src",
    outs = ["tea_lib_src.srcjar"],
    cmd = """
cat << EOF > TeaPot.kt
package tea
object TeaPot {
    fun isEmpty() = true
}
EOF
$(JAVABASE)/bin/jar -cf $@ TeaPot.kt
rm TeaPot.kt
""",
    toolchains = ["@bazel_tools//tools/jdk:current_host_java_runtime"],
    visibility = ["//src/coffee/app:__pkg__"],
)

genrule(
    name = "chai_lib_src",
    outs = ["chai_lib_src.srcjar"],
    cmd = """
cat << EOF > ChaiCup.kt
package chai
object ChaiCup {
    fun isEmpty() = true
}
EOF
$(JAVABASE)/bin/jar -cf $@ ChaiCup.kt
rm ChaiCup.kt
""",
    toolchains = ["@bazel_tools//tools/jdk:current_host_java_runtime"],
    visibility = ["//src/coffee/app:__pkg__"],
)

genrule(
    name = "genereated_module_src",
    outs = ["genarated_module_src.srcjar"],
    cmd = """
cat << EOF > GeneratedModule.kt
package generated

import dagger.Provides
import dagger.Module

@Module
object GeneratedModule {
    @Provides
    fun provideString() = "Hello Coffee"
}
EOF
$(JAVABASE)/bin/jar -cf $@ GeneratedModule.kt
rm GeneratedModule.kt
""",
    toolchains = ["@bazel_tools//tools/jdk:current_host_java_runtime"],
)

kt_jvm_library(
    name = "generated_lib",
    srcs = [":genereated_module_src"],
    visibility = [
        "//src/coffee/app:__pkg__",
        "//src/coffee/wiring:__pkg__",
    ],
    deps = [
        "//third_party:dagger",
    ],
)

java_binary(
    name = "coffee_app",
    main_class = "coffee.app.CoffeeApp",
    visibility = ["//visibility:public"],
    runtime_deps = ["//src/coffee/app:coffee_lib"],
)
