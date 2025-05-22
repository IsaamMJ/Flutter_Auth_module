// validators.dart
import 'package:flutter/material.dart';

class Validators {
  static FormFieldValidator<String> emailValidator() {
    return (value) {
      if (value == null || value.isEmpty) return 'Email is required';
      if (!isValidEmail(value)) return 'Enter a valid email';
      return null;
    };
  }

  static FormFieldValidator<String> passwordValidator() {
    return (value) {
      if (value == null || value.isEmpty) return 'Password is required';
      if (!isStrongPassword(value)) {
        return 'Use a stronger password';
      }
      return null;
    };
  }

  static FormFieldValidator<String> confirmPasswordValidator(TextEditingController passwordController) {
    return (value) {
      if (value == null || value.isEmpty) return 'Please confirm your password';
      if (value != passwordController.text) return 'Passwords do not match';
      return null;
    };
  }


  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email.trim());
  }

  static bool isStrongPassword(String password) {
    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return regex.hasMatch(password);
  }
}
