load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "wiring",
    srcs = glob(["*.kt"]),
    associates = ["//src/coffee/base:coffee_base"],
    visibility = ["//src/coffee/app:__pkg__"],
    deps = [
        "//src:generated_lib",
        "//third_party:dagger",
    ],
)
