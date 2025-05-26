import 'package:get/get.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/signup_page.dart';
import '../presentation/bindings/login_binding.dart';
import '../presentation/bindings/signup_binding.dart';
import 'app_routes.dart';
import '../auth_module_initializer.dart';

class AuthPages {
  static List<GetPage> routes() {
    final client = AuthModule.config.supabaseClient;

    return [
      GetPage(
        name: AuthRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding(supabaseClient: client),
        preventDuplicates: true,
      ),
      GetPage(
        name: AuthRoutes.signup,
        page: () => const SignUpPage(),
        binding: SignUpBinding(supabaseClient: client),
      ),
    ];
  }
}
