import 'package:flutter/material.dart';

class PasswordFieldValidator {
  PasswordFieldValidator._();

  /// Returns a localised error message if the [value] is invalid password.
  /// Otherwise returns [null].
  static String? validate(BuildContext context, String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    bool passwordValid =
        RegExp(r"^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{8,}$")
            .hasMatch(value);
    if (!passwordValid) {
      return 'Password should be at least 8 alphanumerical characters with at least 1 capital letter';
    }
    return null;
  }
}
