# Copyright 2018 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
load("@rules_kotlin//kotlin:core.bzl", "define_kt_toolchain")

package(default_visibility = ["//visibility:private"])

define_kt_toolchain(
    name = "kotlin_toolchain",
    api_version = "2.1",
    experimental_remove_private_classes_in_abi_jars = True,
    experimental_treat_internal_as_private_in_abi_jars = True,
    experimental_use_abi_jars = True,
    language_version = "2.1",
)
