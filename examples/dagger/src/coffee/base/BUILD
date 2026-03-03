load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "coffee_base",
    srcs = glob(["*.kt"]),
    visibility = [
        "//src/coffee/app:__pkg__",
        "//src/coffee/wiring:__pkg__",
    ],
    deps = [
        "//third_party:dagger",
        "@maven_rules_kotlin_example//:org_jetbrains_kotlinx_kotlinx_coroutines_core",
        "@maven_rules_kotlin_example//:org_jetbrains_kotlinx_kotlinx_coroutines_core_jvm",
    ],
)
