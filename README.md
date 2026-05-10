<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Package Introduction

This package is useful for saving time when doing different projects as it contains custom widgets built on top of other widgets and utilities to adapt a design system.

## Features

This package has different kinds of widgets and utils customized to adapt a design system, this is to avoid repetition. DRY.

## Getting started

This is just a plug and play widgets that adapt a design system.
Setup:
on ```pubspect.yaml```
under the flutter line in the dependencies, include this package inogami_ui then provide the link

```dependencies:
    flutter:
        sdk: flutter
    inogami_ui:
        git: https://github.com/inogami-dev/inogami_ui.git
```

or when using offline from a parent folder

``` dependencies:
        flutter:
            sdk: flutter
        inogami_ui:
            path: ../ 
```

## Usage

As of now (May 9, 2026) Widgets and utilities that are currently available are:

``` MyText(text),
    MyTextField(labelText, prefixIcon, textController),
    showMyAnimatedSnackBar(context, textToDisplay),
    MyBottomNavBar(mainPages, navBarItems),

    MyDimensions.width(context) or MyDimensions.height(context)
```

## Additional information

No additional info yet.
