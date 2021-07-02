import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color backgroundColor = Color(0xFF252C39);
  static const Color darkBackGroundColor = Color(0xFF181E28);
  static const Color borderColor = Color(0xFF505D75);
  static const Color greyColor = Color(0xFF7889A9);
  static const Color whiteColor = Color(0xFFD7DDE8);

  static const Color textFieldFillColor = Color(0xFF2E394E);

  static const Color redButtonColor = Color(0xFFEC0000);
  static const Color darkRedButtonColor = Color(0xFF540000);
  static const Color greyButtonColor = Color(0xFF505D75);
  static const Color darkGreyButtonColor = Color(0xFF181E28);

  static const Color whiteTextColor = Color(0xFFD7DDE8);
  static const Color whiteTextColor1 = Color(0xFFE5E5E5);
  static const Color greyTextColor = Color(0xFF7889A9);
  static const Color blackTextColor = Color(0xFF151A24);

  static const LinearGradient redButtonGradient = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(-1.0, 1.0),
    colors: [redButtonColor, darkRedButtonColor],
  );

  static const LinearGradient greyButtonGradient = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(-1.0, 1.0),
    colors: [greyButtonColor, darkGreyButtonColor],
  );

  static const LinearGradient greyButtonGradientRevesre = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(-1.0, 1.0),
    colors: [darkGreyButtonColor, greyButtonColor],
  );

  static const LinearGradient blackGradient = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(-1.0, 1.0),
    colors: [Color(0xFF232A36), Color(0xFF1B202B)],
  );
}
