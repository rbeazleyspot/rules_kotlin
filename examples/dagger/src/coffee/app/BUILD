load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "coffee_lib",
    srcs = glob(["*.kt"]) + [
        "//src:chai_lib_src",
        "//src:tea_lib_src",
    ],
    visibility = ["//src:__pkg__"],
    deps = [
        "//src/coffee/base:coffee_base",
        "//src/coffee/wiring",
        "@maven_rules_kotlin_example//:org_jetbrains_kotlinx_kotlinx_coroutines_core",
        "@maven_rules_kotlin_example//:org_jetbrains_kotlinx_kotlinx_coroutines_core_jvm",
    ],
)
