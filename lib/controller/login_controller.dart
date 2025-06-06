import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/entities/credentials.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool loading = false.obs;

  LoginController(this._loginUseCase);

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Input Error', 'Email and password are required.');
      return;
    }

    loading.value = true;

    try {
      final credentials = Credentials(email: email, password: password);
      final user = await _loginUseCase.execute(credentials);

      if (user != null) {
        Get.snackbar('Login Success', 'Welcome ${user.email}');
        // Host app should listen to session state and handle navigation
      } else {
        Get.snackbar('Login Failed', 'Incorrect email or password.');
      }
    } catch (e, stack) {
      Get.snackbar('Error', 'Something went wrong. Please try again.');
      debugPrintStack(stackTrace: stack);
    } finally {
      loading.value = false;
    }
  }

  void reset() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
