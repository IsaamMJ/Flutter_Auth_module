import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/entities/credentials.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  final void Function()? onLoginSuccess;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool loading = false.obs;
  final RxBool shouldNavigate = false.obs; // ✅ NEW

  LoginController(
      this._loginUseCase, {
        this.onLoginSuccess,
      });

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    print('[LoginController] login() called');
    print('[LoginController] Email: $email');

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Input Error', 'Email and password are required.');
      return;
    }

    loading.value = true;

    try {
      final credentials = Credentials(email: email, password: password);
      final user = await _loginUseCase.execute(credentials);

      print('[LoginController] Login result user: $user');

      if (user != null) {
        Get.snackbar('Login Success', 'Welcome ${user.email}');
        print('[LoginController] Login succeeded — triggering success flow');

        onLoginSuccess?.call();

        // ✅ Trigger navigation flag
        shouldNavigate.value = true;
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
