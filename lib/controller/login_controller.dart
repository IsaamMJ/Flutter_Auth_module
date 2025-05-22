import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/entities/credentials.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loading = false.obs;

  LoginController(this._loginUseCase);

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Input Error', 'Email and password cannot be empty.');
      return;
    }

    loading.value = true;

    try {
      final credentials = Credentials(email: email, password: password);
      final result = await _loginUseCase.execute(credentials);

      if (result != null) {
        Get.snackbar('Success', 'Welcome ${result.email}');
      } else {
        Get.snackbar('Login Failed', 'Invalid credentials');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
      debugPrint('Login Error: $e');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
