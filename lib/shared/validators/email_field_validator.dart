import 'package:flutter/material.dart';

class EmailFieldValidator {
  EmailFieldValidator._();

  /// Returns a localised error message if the [value] is invalid email address.
  /// Otherwise returns [null].
  static String? validate(BuildContext context, String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'This email is not valid';
    }
    return null;
  }
}
