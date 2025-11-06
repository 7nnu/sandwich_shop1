# Sandwich Shop

A simple cross-platform Flutter app that displays sandwich orders (name + quantity). This repo contains the Flutter/Dart UI plus generated platform runner code for Windows, Linux, macOS, Android, iOS and Web.

This README also documents the separate pricing repository (pricing logic and test suite), the "toasted" switch UI component, and the testing approach used across the codebases.

---

## 1. Project Title and Description

Title: Sandwich Shop

Brief description: A minimal Flutter application demonstrating a sandwich order display UI. Useful as a starter app for cross-platform Flutter development, experimenting with simple order UI widgets, and integrating external pricing logic.

Key features:
- Cross-platform Flutter UI (Android, iOS, Web, Windows, Linux, macOS)
- Simple order list UI showing sandwich names and quantities
- "Toasted" switch widget for each sandwich (toggle toasted state)
- Pricing logic maintained in a separate pricing repository (git dependency or submodule)
- Generated native platform runners (Windows, Linux, macOS) and plugin registrants
- Widget and unit tests included (app tests + pricing repo tests)

---

## 2. Installation and Setup Instructions

Prerequisites
- Flutter SDK (stable channel). Install from https://flutter.dev
- Git
- Platform-specific tools (only install the ones you target):
    - Android: Android SDK + Android Studio (emulator) or a device
    - iOS: Xcode (macOS only)
    - Windows desktop: Visual Studio 2019/2022 with "Desktop development with C++" workload
    - Linux desktop: CMake, build-essential (gcc/clang), GTK dev packages as required
    - macOS desktop: Xcode command line tools
- (Optional) Visual Studio Code or Android Studio for development

Clone the repository
```bash
git clone <your-repo-url> c:\Users\tmhoo\Documents\sandwich_shop
cd c:\Users\tmhoo\Documents\sandwich_shop
```

Adding the pricing repository
- Option A — as a git submodule:
    ```bash
    git submodule add <pricing-repo-url> packages/pricing
    git submodule update --init --recursive
    ```
    Then refer to it in your code with a relative package or by adding it to `pubspec.yaml` as a local package.

- Option B — as a git dependency in pubspec.yaml:
    ```yaml
    dependencies:
        pricing:
            git:
                url: https://github.com/your-org/pricing-repo.git
                ref: main
    ```

Step-by-step installation
1. Ensure Flutter is installed and on your PATH:
     ```bash
     flutter --version
     ```
2. Fetch Dart/Flutter dependencies:
     ```bash
     flutter pub get
     ```
3. (Optional) If you target desktop platforms, ensure native toolchains are installed:
     - Windows: open Visual Studio Installer → add "Desktop development with C++"
     - Linux: install cmake, build-essential (apt: `sudo apt install cmake build-essential`)
     - macOS: ensure Xcode/CLI tools installed

How to run (development)
- Run on default connected device/emulator:
    ```bash
    flutter run
    ```
- Run on a specific device:
    - Android: `flutter run -d <device-id>`
    - Chrome/web: `flutter run -d chrome`
    - Windows: `flutter run -d windows`
    - Linux: `flutter run -d linux`
    - macOS: `flutter run -d macos`

Build release artifacts
- Android APK:
    ```bash
    flutter build apk --release
    ```
- iOS (macOS required):
    ```bash
    flutter build ios --release
    ```
- Web:
    ```bash
    flutter build web --release
    ```
- Windows:
    ```bash
    flutter build windows --release
    ```
- Linux:
    ```bash
    flutter build linux --release
    ```

---

## 3. Usage Instructions

How to use main features
- Launch the app; the main screen shows a list of sandwich orders (name + quantity).
- Each list item includes a "Toasted" switch (toggle) that marks the sandwich as toasted.
- The UI is driven from `lib/main.dart`. The toasted switch component is implemented at:
    - `lib/widgets/toasted_switch.dart`
    - Import and use it like:
        ```dart
        import 'package:your_app/widgets/toasted_switch.dart';

        ToastedSwitch(
            value: order.isToasted,
            onChanged: (v) => setState(() => order.isToasted = v),
        );
        ```
- Pricing is calculated using the pricing repository. The app calls pricing APIs from the pricing package to compute totals (base price, toasted surcharge, quantity, discounts).

Important user flows
- View orders: app shows order items and quantities in a simple Material layout.
- Toggle toasted state: use the toasted switch to mark items as toasted; UI updates and pricing recalculates.
- Modify or expand UI: add new widgets or inputs in `lib/main.dart`.

Configuration options
- No runtime configuration file included by default. For feature flags or environment-specific settings, add a config file or use compile-time environment variables (Flutter build arguments).
- If using the external pricing repo, configure its location (local package path or git dependency) in `pubspec.yaml`.

---

## 4. Testing

Test coverage in this project is split between the app and the pricing repository.

App tests
- Widget tests (example: `test/widget_test.dart`) cover main UI flows and the toasted switch behavior.
- Add a dedicated widget test for the toasted switch at `test/toasted_switch_test.dart`.
- Run app tests:
    ```bash
    flutter test
    ```
- Run with coverage:
    ```bash
    flutter test --coverage
    ```

Pricing repository tests
- The pricing repo contains unit tests for pricing rules (base price, toasted surcharge, promotions).
- If the pricing repo is a local package (submodule or packages/pricing/), run tests in that folder:
    ```bash
    cd packages/pricing
    flutter test   # or `dart test` if pure Dart
    ```
- If configured as a git dependency, run tests in a clone of the pricing repo or include its tests in CI.

Continuous integration
- Recommended CI steps:
    - Checkout submodules (if used)
    - `flutter pub get`
    - `flutter test`
    - Run pricing repo tests
    - Optionally run platform builds

---

## 5. Project Structure and Technologies Used

Brief folder overview
- lib/ — Flutter/Dart app source (UI + logic). Key file: `lib/main.dart`
- lib/widgets/toasted_switch.dart — toasted switch UI component
- test/ — Dart/Flutter tests (`test/widget_test.dart`, `test/toasted_switch_test.dart`)
- packages/pricing/ — optional pricing repository (if added as submodule/local package)
- android/, ios/ — mobile platform runner code
- windows/, linux/, macos/ — generated native runner code and CMake files for desktop builds
- web/ — web entry assets
- pubspec.yaml — Flutter project config and dependencies

Key files and purposes
- lib/main.dart — main app widget(s) and entrypoint
- lib/widgets/toasted_switch.dart — switch widget for toasted state
- test/widget_test.dart — example widget test
- packages/pricing/ — pricing logic and tests (if present)

Key packages / dependencies
- See `pubspec.yaml` for current packages. To add a package:
    ```bash
    flutter pub add <package-name>
    ```

Development tools
- Flutter CLI, Android Studio / Xcode for emulators and device tooling
- Visual Studio (Windows desktop builds)
- VS Code recommended for quick edits and debugging

---

## 6. Known Issues or Limitations

Current limitations
- Minimal feature set: no persistence (local DB), no backend integration, no user accounts, and no ordering flow.
- Pricing repo is separate and must be integrated manually (git submodule or git dependency).
- Toasted switch only updates local UI state by default; persist state or sync to backend as needed.
- Accessibility and advanced UI states not fully covered (keyboard navigation, focus management, semantics for web).

Planned improvements
- Add ordering flow and persistence (e.g., local SQLite or cloud backend)
- Integrate pricing repo as a published package for easier consumption
- Add images and richer UI for sandwiches
- Add CI to run `flutter test`, pricing repo tests, and multi-platform builds

---

## Contribution Guidelines

If you want to contribute:
1. Fork the repo
2. Create a feature branch:
     ```bash
     git checkout -b feat/your-feature
     ```
3. Make changes, run tests:
     ```bash
     flutter test
     ```
     and run pricing tests if you modified pricing logic.
4. Commit and push, then open a PR with a description and platform testing notes.

Suggested repository additions
- Add `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, and a license file (e.g., MIT or Apache-2.0).

Example commit flow
```bash
git add .
git commit -m "Add new sandwich UI"
git push origin feat/your-feature
# open PR on Git hosting
```

---

## License

This project currently has no license file. Add a LICENSE in the repository root (MIT or Apache-2.0 recommended if you want it open-source).

---

## Contact Information

github.com/7nnu
