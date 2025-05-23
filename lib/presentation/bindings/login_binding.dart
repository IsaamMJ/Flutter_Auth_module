import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../controller/login_controller.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginBinding extends Bindings {
  final SupabaseClient supabaseClient;

  LoginBinding({
    required this.supabaseClient,
  });

  @override
  void dependencies() {
    // 🔐 Register repository and use case
    Get.put<AuthRepository>(AuthRepositoryImpl(supabaseClient));
    Get.put<LoginUseCase>(LoginUseCase(Get.find<AuthRepository>()));

    // 🧠 Create controller without host callback dependency
    Get.put<LoginController>(
      LoginController(Get.find<LoginUseCase>()),
    );
  }
}
