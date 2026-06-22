import 'package:flutter/material.dart';

Shadow get defaultShadow => Shadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 4.0,
      offset: const Offset(0, 4.0),
    );

BoxShadow get defaultBoxShadow => const BoxShadow(
      color: Color(0x40000000), // 25% opacity black
      offset: Offset(0, 4), // X: 0, Y: 4
      blurRadius: 4,
      spreadRadius: 0,
    );

const desktopHozPadding = 64.0;
const tabletHozPadding = 24.0;
const mobileHozPadding = 16.0;
const cardRadius = 12.0;
const lThemeButtonSize = 40.0;
const mThemeButtonSize = 32.0;
const sThemeButtonSize = 28.0;

const smallButtonIcon = 24.0;
const mediumButtonIcon = 28.0;
const largeButtonIcon = 36.0;

const smallSpacing = 24.0;
const mediumSpacing = 40.0;
const largeSpacing = 56.0;