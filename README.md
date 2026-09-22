# Google Cast iOS SDK (Swift Package Manager)

This repository provides a `Package.swift` manifest to enable integration of the
Google Cast SDK for iOS via Swift Package Manager (SPM).

This repository does not contain the source code or binary artifacts of the
Google Cast SDK. It acts solely as a pointer to download the official binary
distribution securely.

## Installation

### Xcode

1. In Xcode, select **File** > **Add Packages...**
2. Enter the repository URL: `https://github.com/googlecast/google-cast-ios-sdk`
3. Select your desired versioning rules.
4. Click **Add Package**.
5. Select the product (GoogleCastDynamic or GoogleCastStatic) you want to add to
   your target. Do not try to add both.

   **Note on Static Framework:** If you choose the static variant (`GoogleCastStatic`), you must complete the following manual steps:

   1. **Add Linker Flags:** In your Xcode project, add the flags `-ObjC -lc++` to **Build Settings** > **Other Linker Flags**.
   2. **Add Asset Bundles:** Due to limitations with Swift Package Manager, it is not possible to automatically bundle required asset resources (such as UI images, storyboards, and localization files) with the static version of the framework. If you require Cast UI components, you must manually integrate these assets. To do so, download the static SDK archive from the [official Google Cast iOS SDK developer documentation](https://developers.google.com/cast/docs/ios_sender). Locate the `Resources` folder in the unzipped directory and drag all of the `.bundle` files into your Xcode project. Check 'Copy all items if needed', and add to all targets.

   Alternatively, you can use the dynamic version (`GoogleCastDynamic`), which natively includes all necessary assets and does not require additional linker flags.

## Usage

For instructions on how to use the Google Cast SDK in your application, please
refer to the official
[Google Cast Developer Documentation](https://developers.google.com/cast/docs/ios_sender).

## How to contribute

Review [How to Contribute](./CONTRIBUTING.md) for details on submitting issues
or improvements to this manifest.

## License

This repository manifest is licensed under the Apache 2.0 License. See the
[LICENSE](LICENSE) file for details. The Google Cast SDK itself is governed by
its own terms of service and license agreement.

---

Eligibility for the
[Google Open Source Software Vulnerability Rewards Program](https://bughunters.google.com/open-source-security)
is determined by the
[Google Open Source Software Vulnerability Reward Program Rules](https://bughunters.google.com/about/rules/open-source/google-open-source-software-vulnerability-reward-program-rules).
