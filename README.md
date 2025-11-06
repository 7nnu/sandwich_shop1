// ...existing code...
# Sandwich Shop

A simple cross-platform Flutter app that displays sandwich orders (name + quantity). This repo contains the Flutter/Dart UI plus generated platform runner code for Windows, Linux, macOS, Android, iOS and Web.

---

## 1. Project Title and Description

Title: Sandwich Shop

Brief description: A minimal Flutter application demonstrating a sandwich order display UI. Useful as a starter app for cross-platform Flutter development and for experimenting with simple order UI widgets.

Key features:
- Cross-platform Flutter UI (Android, iOS, Web, Windows, Linux, macOS)
- Simple order list UI showing sandwich names and quantities
- Generated native platform runners (Windows, Linux, macOS) and plugin registrants
- Basic widget test included

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
- The UI is driven from `lib/main.dart`. Edit that file to change displayed items, add interactions, or connect to a backend.

Important user flows
- View orders: app shows order items and quantities in a simple Material layout.
- Modify or expand UI: add new widgets or inputs in `lib/main.dart`.

Configuration options
- No runtime configuration file included by default. For feature flags or environment-specific settings, add a config file or use compile-time environment variables (Flutter build arguments).

Running tests
- A basic widget test is located at `test/widget_test.dart`.
- Run tests:
  ```bash
  flutter test
  ```

Screenshots / GIFs
- Add screenshots to an `assets/` folder and reference them here. Example:
  ```markdown
  ![App screenshot](assets/screenshot.png)
  ```
- (Placeholders are left intentionally — add images when available.)

---

## 4. Project Structure and Technologies Used

Brief folder overview
- lib/ — Flutter/Dart app source (UI + logic). Key file: `lib/main.dart`
- test/ — Dart/Flutter tests (`test/widget_test.dart`)
- android/, ios/ — mobile platform runner code
- windows/, linux/, macos/ — generated native runner code and CMake files for desktop builds
- web/ — web entry assets
- pubspec.yaml — Flutter project config and dependencies

Key files and purposes
- lib/main.dart — main app widget(s) and entrypoint
- test/widget_test.dart — example widget test
- windows/runner/* and linux/runner/* — platform bootstrap code (generated)
- linux/CMakeLists.txt, windows/CMakeLists.txt — desktop build configuration

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

## 5. Known Issues or Limitations

Current limitations
- Minimal feature set: no persistence (local DB), no backend integration, no user accounts, and no ordering flow.
- Platform runner files are the generated stubs; native plugin code is not implemented.
- Accessibility and advanced UI states not fully covered (keyboard navigation, focus management, semantics for web).

Common platform build notes
- Windows: ensure Visual Studio C++ workload installed and target architecture matches build settings.
- macOS/iOS: building for iOS requires Xcode on macOS.
- Linux: ensure GTK and CMake toolchain installed.

Planned improvements
- Add ordering flow and persistence (e.g., local SQLite or cloud backend)
- Add images and richer UI for sandwiches
- Add CI to run `flutter test` and multi-platform builds

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

If you want, I can replace the current README.md file with this content — confirm and I will write it to c:\Users\tmhoo\Documents\sandwich_shop\README.md.
```// filepath: c:\Users\tmhoo\Documents\sandwich_shop\README.md
// ...existing code...
# Sandwich Shop

A simple cross-platform Flutter app that displays sandwich orders (name + quantity). This repo contains the Flutter/Dart UI plus generated platform runner code for Windows, Linux, macOS, Android, iOS and Web.

---

## 1. Project Title and Description

Title: Sandwich Shop

Brief description: A minimal Flutter application demonstrating a sandwich order display UI. Useful as a starter app for cross-platform Flutter development and for experimenting with simple order UI widgets.

Key features:
- Cross-platform Flutter UI (Android, iOS, Web, Windows, Linux, macOS)
- Simple order list UI showing sandwich names and quantities
- Generated native platform runners (Windows, Linux, macOS) and plugin registrants
- Basic widget test included

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
- The UI is driven from `lib/main.dart`. Edit that file to change displayed items, add interactions, or connect to a backend.

Important user flows
- View orders: app shows order items and quantities in a simple Material layout.
- Modify or expand UI: add new widgets or inputs in `lib/main.dart`.

Configuration options
- No runtime configuration file included by default. For feature flags or environment-specific settings, add a config file or use compile-time environment variables (Flutter build arguments).

Running tests
- A basic widget test is located at `test/widget_test.dart`.
- Run tests:
  ```bash
  flutter test
  ```

Screenshots / GIFs
- Add screenshots to an `assets/` folder and reference them here. Example:
  ```markdown
  ![App screenshot](assets/screenshot.png)
  ```
- (Placeholders are left intentionally — add images when available.)

---

## 4. Project Structure and Technologies Used

Brief folder overview
- lib/ — Flutter/Dart app source (UI + logic). Key file: `lib/main.dart`
- test/ — Dart/Flutter tests (`test/widget_test.dart`)
- android/, ios/ — mobile platform runner code
- windows/, linux/, macos/ — generated native runner code and CMake files for desktop builds
- web/ — web entry assets
- pubspec.yaml — Flutter project config and dependencies

Key files and purposes
- lib/main.dart — main app widget(s) and entrypoint
- test/widget_test.dart — example widget test
- windows/runner/* and linux/runner/* — platform bootstrap code (generated)
- linux/CMakeLists.txt, windows/CMakeLists.txt — desktop build configuration

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

## 5. Known Issues or Limitations

Current limitations
- Minimal feature set: no persistence (local DB), no backend integration, no user accounts, and no ordering flow.
- Platform runner files are the generated stubs; native plugin code is not implemented.
- Accessibility and advanced UI states not fully covered (keyboard navigation, focus management, semantics for web).

Common platform build notes
- Windows: ensure Visual Studio C++ workload installed and target architecture matches build settings.
- macOS/iOS: building for iOS requires Xcode on macOS.
- Linux: ensure GTK and CMake toolchain installed.

Planned improvements
- Add ordering flow and persistence (e.g., local SQLite or cloud backend)
- Add images and richer UI for sandwiches
- Add CI to run `flutter test` and multi-platform builds

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