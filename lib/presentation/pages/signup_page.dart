import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/sign_up_controller.dart';
import '../../core/utils/validators.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),

                    // Email Field
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.emailValidator(),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.passwordValidator(),
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password Field
                    TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.confirmPasswordValidator(controller.passwordController),
                    ),
                    const SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = formKey.currentState?.validate() ?? false;
                          if (isValid) {
                            controller.submit();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Redirect to login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already a user? "),
                        GestureDetector(
                          onTap: () => Get.offNamed('/login', preventDuplicates: false),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
