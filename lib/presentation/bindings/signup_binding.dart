import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../controller/sign_up_controller.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecase/signup_usecase.dart';

class SignUpBinding extends Bindings {
  final SupabaseClient supabaseClient;

  SignUpBinding({required this.supabaseClient});

  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(supabaseClient));
    Get.lazyPut(() => SignUpUseCase(Get.find()));
    Get.lazyPut(() => SignUpController(Get.find<SignUpUseCase>()));
  }
}
