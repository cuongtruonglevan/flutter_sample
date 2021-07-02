import 'package:flutter/material.dart';

class RequiredFieldValidator {
  RequiredFieldValidator._();

  /// Returns error message if the value is invalid.
  /// Otherwise returns [null].
  static String? validate(BuildContext context, dynamic value) {
    if (value == null) {
      return 'This field is required';
    }
    if (value is String && value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
