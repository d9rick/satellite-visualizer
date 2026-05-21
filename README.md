# Satellite Visualizer (flutter_sat)

A cross-platform Flutter application for visualizing satellites in 3D orbit around the Earth.

## Overview

Satellite Visualizer utilizes TLE (Two-Line Element set) data to accurately plot and track satellite orbits on a highly interactive, visually appealing 3D globe. Built with Flutter, it achieves high-performance GPU-accelerated rendering using fragment shaders.

### Features

- **Interactive 3D Globe**: Rendered with custom fragment shaders for smooth, high-octane 3D interaction.
- **Satellite Tracking**: Dynamic rendering of satellite positions across the globe using imported TLE data.
- **Day/Night & Atmosphere Effects**: Visual enhancements including atmospheric glows, directional lighting, and realistic day/night modes.
- **Cross-Platform**: Designed flexibly for Android, iOS, Web, Windows, macOS, and Linux.

## Tech Stack & Architecture

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Riverpod (`flutter_riverpod`)](https://riverpod.dev/) for predictable, reactive state handling.
- **Data Persistence**: [Hive (`hive_flutter`)](https://docs.hivedb.dev/) for fast, local NoSQL caching of settings and datasets.
- **Networking**: [Dio](https://pub.dev/packages/dio) for optimized HTTP data fetching.
- **3D Rendering**: Powered by the local [`flutter_earth_globe`](packages/flutter_earth_globe) package.
- **Code Generation**: Leverages `freezed_annotation` and `json_serializable` for robust, immutable data models.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (^3.11.0 or higher).
- Ensure your platform build toolchains (Android Studio, Xcode, Linux tools) are properly configured.
  _(Note: on some Linux distributions like openSUSE, package dependencies like `gstreamer-devel` are required for media compatibilities)._

### Installation

1. **Clone the repository.**
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run code generation (if modifying models):**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Run the Application:**
   - **Mobile / Desktop:**
     ```bash
     flutter run
     ```
   - **Web (IMPORTANT):**
     You _must_ compile and run the web version using WebAssembly (`--wasm`) for the 3D globe fragment shaders to work correctly.
     ```bash
     flutter run -d chrome --wasm
     ```

## Project Structure

- `lib/app/`: Core app configuration and theming.
- `lib/core/`: Application constants and foundational utilities.
- `lib/data/tle/`: TLE data models, parsing, and local data source management.
- `lib/domain/satellite/`: Domain rules and orbit trajectory functionality.
- `lib/state/`: Global Riverpod providers and shared state modules.
- `lib/ui/`: Presentation layer, split between `screens/` (e.g., `globe_screen.dart`) and shared `widgets/`.
- `packages/flutter_earth_globe/`: The core 3D globe rendering standalone library package.
