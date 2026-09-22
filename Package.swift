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
  dependencies: [
    .package(url: "https://github.com/google/gtm-session-fetcher.git", .upToNextMajor(from: "3.0.0"))
  ],
  targets: [
    .target(
      name: "GoogleCastStatic",
      dependencies: [
        .target(name: "GoogleCastStaticBinary"),
        .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher")
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
      url: "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-4.8.6_static.zip",
      checksum: "e1fe7fd6f2bf4b58e830d378fafc435d159bd755f7ee20fd3033aa1ce313cd6e"
    ),
    .target(
      name: "GoogleCastDynamic",
      dependencies: [
        .target(name: "GoogleCastDynamicBinary"),
        .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher")
      ],
      path: ".",
      sources: ["GoogleCastDynamic.swift"]
    ),
    .binaryTarget(
      name: "GoogleCastDynamicBinary",
      url: "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-4.8.6_dynamic.zip",
      checksum: "55f6c21291a1315c68063f07e7d76225564bff70f2fd38caad135c71d66eb310"
    ),
  ]
)
