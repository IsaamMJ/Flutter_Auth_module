import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'controller/login_controller.dart';
import 'controller/sign_up_controller.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecase/login_usecase.dart';
import 'domain/usecase/signup_usecase.dart';


class AuthModule {
  static void init({
    required SupabaseClient supabaseClient,
  }) {
    // ✅ Repository
    Get.put<AuthRepository>(
      AuthRepositoryImpl(supabaseClient),
      permanent: true,
    );

    // ✅ Use Cases
    Get.lazyPut(() => LoginUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => SignUpUseCase(Get.find()), fenix: true);

    // ✅ Controllers
    Get.put<LoginController>(
      LoginController(Get.find<LoginUseCase>()),
      permanent: true,
    );

    Get.put<SignUpController>(
      SignUpController(Get.find<SignUpUseCase>()),
      permanent: true,
    );
  }
}
