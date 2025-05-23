import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/entities/credentials.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool loading = false.obs;
  final RxBool shouldNavigate = false.obs; // ✅ Reactive navigation signal

  LoginController(this._loginUseCase);

  @override
  void onInit() {
    super.onInit();

    // ✅ Automatically navigate when login succeeds
    ever(shouldNavigate, (bool navigate) {
      if (navigate) {
        shouldNavigate.value = false;
        Get.offAllNamed('/main');
      }
    });
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    debugPrint('[LoginController] login() called');
    debugPrint('[LoginController] Email: $email');

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Input Error', 'Email and password are required.');
      return;
    }

    loading.value = true;

    try {
      final credentials = Credentials(email: email, password: password);
      final user = await _loginUseCase.execute(credentials);

      debugPrint('[LoginController] Login result user: $user');

      if (user != null) {
        Get.snackbar('Login Success', 'Welcome ${user.email}');
        shouldNavigate.value = true; // ✅ Signal successful login
      } else {
        Get.snackbar('Login Failed', 'Incorrect email or password.');
      }
    } catch (e, stack) {
      Get.snackbar('Error', 'Something went wrong. Please try again.');
      debugPrint('[LoginController] Login error: $e');
      debugPrintStack(stackTrace: stack);
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
