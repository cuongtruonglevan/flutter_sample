import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppColors {
  AppColors._();

  static const Color ff252c39 = Color(0xFF252C39);
  static const Color ff181e28 = Color(0xFF181E28);
  static const Color ff505d75 = Color(0xFF505D75);
  static const Color ff7889a9 = Color(0xFF7889A9);
  static const Color ffd7dde8 = Color(0xFFD7DDE8);
  static const Color ff2e394e = Color(0xFF2E394E);
  static const Color ffec0000 = Color(0xFFEC0000);
  static const Color ff540000 = Color(0xFF540000);
  static const Color ff1b202b = Color(0xFF1B202B);
  static const Color ffe5e5e5 = Color(0xFFE5E5E5);
  static const Color ff151a24 = Color(0xFF151A24);
  static const Color ff8290aa = Color(0xFF8290aa);

  static const LinearGradient redGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [ffec0000, ff540000],
    transform: GradientRotation(-0.1),
  );

  static const LinearGradient greyGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.centerRight,
    colors: [Color(0xff2e3747), ff252c39],
    transform: GradientRotation(1),
  );

  static const LinearGradient infiniteGreyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [ff505d75, ff252c39],
    transform: GradientRotation(-0.1),
  );

  static const LinearGradient greyGradientRevesre = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [ff505d75, ff252c39],
    transform: GradientRotation(-0.1),
  );

  static const LinearGradient blackGradient = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(-1.0, 1.0),
    colors: [Color(0xFF232A36), Color(0xFF1B202B)],
    transform: GradientRotation(math.pi * 154.8 / 360),
  );

  static const LinearGradient lightGreyGradient = LinearGradient(
    begin: Alignment.center,
    end: Alignment.topLeft,
    colors: [
      Color.fromRGBO(120, 137, 169, 0.25),
      Color.fromRGBO(215, 221, 232, 0.25),
    ],
  );

  static const LinearGradient whiteGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff797979), Color(0xff8F8888)],
    transform: GradientRotation(-0.1),
  );
}
