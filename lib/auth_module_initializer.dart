import 'package:get/get.dart';
import 'controller/login_controller.dart';
import 'controller/sign_up_controller.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecase/login_usecase.dart';
import 'domain/usecase/signup_usecase.dart';
import 'auth_module_config.dart';

class AuthModule {
  static late AuthModuleConfig config;

  static void init(AuthModuleConfig newConfig) {
    config = newConfig;

    // Repositories
    Get.put<AuthRepository>(AuthRepositoryImpl(config.supabaseClient), permanent: true);

    // Use cases
    Get.lazyPut(() => LoginUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => SignUpUseCase(Get.find()), fenix: true);

    // Controllers
    Get.put<LoginController>(LoginController(Get.find<LoginUseCase>()), permanent: true);
    Get.put<SignUpController>(SignUpController(Get.find<SignUpUseCase>()), permanent: true);
  }
}
