// swift-tools-version:5.7
// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleCast",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "GoogleCastStatic",
      targets: ["GoogleCastStatic"]
    ),
    .library(
      name: "GoogleCastDynamic",
      targets: ["GoogleCastDynamic"]
    ),
  ],
  targets: [
    .target(
      name: "GoogleCastStatic",
      dependencies: [
        .target(name: "GoogleCastStaticBinary")
      ],
      path: ".",
      sources: ["GoogleCastStatic.swift"],
      linkerSettings: [
        .linkedFramework("AVFoundation"),
        .linkedFramework("AVRouting"),
        .linkedFramework("Accelerate"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("CFNetwork"),
        .linkedFramework("CoreBluetooth"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreText"),
        .linkedFramework("Foundation"),
        .linkedFramework("MediaAccessibility"),
        .linkedFramework("MediaPlayer"),
        .linkedFramework("Network"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("Security"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
        .linkedLibrary("z"),
        .linkedLibrary("c++"),
      ]
    ),
    .binaryTarget(
      name: "GoogleCastStaticBinary",
      url: "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-4.8.4_static.zip",
      checksum: "964a3b2103b68bfa9d62e1ce39fd591ebadd0093086c0c340efcede00d356804"
    ),
    .target(
      name: "GoogleCastDynamic",
      dependencies: [
        .target(name: "GoogleCastDynamicBinary")
      ],
      path: ".",
      sources: ["GoogleCastDynamic.swift"]
    ),
    .binaryTarget(
      name: "GoogleCastDynamicBinary",
      url: "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-4.8.4_dynamic.zip",
      checksum: "c9c3a794e8585198b59c6bb7da5418a3194ffa1ffa6f9a1cbdf4dc0ea26dc6cf"
    ),
  ]
)
