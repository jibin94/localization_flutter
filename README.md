# localization_flutter

This Flutter project demonstrates a localization setup for a multi-language app supporting **English**, **Arabic**, and **Hindi**. "

## Features

- Supports **English**, **Arabic**, and **Hindi** languages.
- Dynamic pluralization using `.arb` files.
- Easy language switching with `Provider` for state management.
- Maintains user preferences for language selection using `SharedPreferences`.

## Setup

Step 1: Add dependencies

The first step towards supporting multiple languages in a Flutter application is to add the necessary dependencies into your Flutter project. Please run the commands provided below in your terminal to incorporate them:
```
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any
```
After adding them, ensure the pubspec.yaml file is updated to reflect these changes.

```
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: any
```

Step 2: Enable generation of localization files

To enable automatic generation of localization files, please update the pubspec.yaml file by adding the following line to the flutter section.
```
flutter:
  generate: true
```

Step 3: Configure localization tool

Create a new `l10n.yaml` file in the root of the Flutter project. This file will hold the configuration for the gen_l10n tool.

`arb-dir` – the path of the directory that contains the translation files.
`template-arb-file` – the name of the template arb file that will be used as basis for generating the Dart localization files.
`output-localization-file` – the name of the file for the output localization and localizations delegate classes.

```
arb-dir: lib/l10n
template-arb-file: intl_en.arb
output-localization-file: app_localizations.dart
```

Step 4: Add translation files

Next, let's add the l10n directory with three ARB files: intl_ar.arb, intl_en.arb, and intl_hi.arb. These files are going to hold translations for Arabic, English, and Hindi, respectively. Below, you can see the project structure after adding these files and their content.

FLUTTER PROJECT
```
|-- ...
|-- android
|-- ios
|-- lib
|   |-- l10n
|       |-- app_ar.arb
|       |-- app_en.arb
|       |-- app_hi.arb
|   |-- main.dart
|-- pubspec.yaml
|-- ...
```

Step 5: Generate localization files

Run the command `flutter gen-l10n` to generate localization files whenever the .arb files are updated. 

## Lists of directional widgets:

To improve the layout in your Flutter app, especially when dealing with RTL (Right-to-Left) and LTR (Left-to-Right) languages, you can make use of the directional widgets that automatically adjust based on the current locale (LTR or RTL). These widgets automatically handle the differences between left and right by using start and end instead, which are locale-aware.
```
* EdgeInsetsDirectional
* AlignmentDirectional
* BorderDirectional
* BorderRadiusDirectional
* PositionedDirectional
* AnimatedPositionedDirectional
```

Localization demo:<br />
![](https://github.com/jibin94/localization_flutter/blob/main/demo-video.gif)
