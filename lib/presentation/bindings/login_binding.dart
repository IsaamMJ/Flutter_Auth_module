import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../controller/login_controller.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginBinding extends Bindings {
  final SupabaseClient supabaseClient;
  final void Function()? onLoginSuccess;

  LoginBinding({
    required this.supabaseClient,
    this.onLoginSuccess,
  });

  @override
  void dependencies() {
    // 🔐 Register repository and use case (non-permanent for flexibility)
    Get.put<AuthRepository>(AuthRepositoryImpl(supabaseClient));
    Get.put<LoginUseCase>(LoginUseCase(Get.find<AuthRepository>()));

    // 🧠 Force fresh controller with new callback every time
    Get.put<LoginController>(
      LoginController(
        Get.find<LoginUseCase>(),
        onLoginSuccess: onLoginSuccess,
      ),
    );
  }
}
