import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/credentials.dart';
import '../../domain/usecase/signup_usecase.dart';

class SignUpController extends GetxController {
  final SignUpUseCase _signUpUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;

  SignUpController(this._signUpUseCase);

  Future<void> submit() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Validation Error', 'All fields are required');
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Invalid Email', 'Please enter a valid email address');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Password Mismatch', 'Passwords do not match');
      return;
    }

    isLoading.value = true;

    try {
      final credentials = Credentials(email: email, password: password);
      final result = await _signUpUseCase.execute(credentials);

      if (result != null) {
        Get.snackbar('Success', 'Account created successfully');
      } else {
        Get.snackbar('Signup Failed', 'Something went wrong. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error during signup');
      debugPrint('Signup error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
