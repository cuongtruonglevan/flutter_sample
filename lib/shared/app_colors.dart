import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color backgroundColor = Color(0xff252C39);
  static const Color transHistoryColor = Color(0xff181E28);
  static const Color borderColor = Color(0xff505D75);
  static const Color redButtonColor = Color(0xffEC0000);
  static const Color darkRedButtonColor = Color(0xff540000);
  static const Color greyButtonColor = Color(0xff505D75);
  static const Color darkGreyButtonColor = Color(0xff181E28);
  static const Color greyTextColor = Color(0xff7889A9);
  static const Color whiteTextColor = Color(0xffD7DDE8);
  static const Color blackTextColor = Color(0xff151A24);

  static const LinearGradient redButtonGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: [redButtonColor, darkRedButtonColor]);

  static const LinearGradient greyButtonGradient = LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(-1.0, 1.0),
      colors: [
        Color(0xFF505d75),
        Color(0xFF404B5F),
        Color(0xFF404A5E),
        Color(0xFF3F4A5D),
        Color(0xFF3F495C),
        Color(0xFF313A4A),
        Color(0xFF1B202B),
      ],
      stops: [
        0.0,
        0.3175,
        0.3176,
        0.3177,
        0.3178,
        0.5729,
        1.0,
      ]);
}
