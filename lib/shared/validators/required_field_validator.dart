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

class RequiredConfirmFieldValidator {
  RequiredConfirmFieldValidator._();

  /// Returns error message if the value is invalid.
  /// Otherwise returns [null].
  static String? validate(BuildContext context, dynamic value1, dynamic value2) {
    if (value1 == null) {
      return 'This field is required';
    }
    if (value1 is String && value1.isNotEmpty) {
      if(value1 != value2) {
        return 'Both input passwords are not matched.';
      }
    } else {
      return 'This field is required';
    }
    return null;
  }
}
