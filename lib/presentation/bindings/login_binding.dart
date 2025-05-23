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
    // 🔐 Register the repository and use case
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(supabaseClient));
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepository>()));

    // 🧠 Register the controller and inject the callback
    Get.put(() => LoginController(
      Get.find<LoginUseCase>(),
      onLoginSuccess: onLoginSuccess,
    ));
  }
}
