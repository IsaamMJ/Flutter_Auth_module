import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../presentation/pages/login_page.dart';
import '../presentation/pages/signup_page.dart';
import '../presentation/bindings/login_binding.dart';
import '../presentation/bindings/signup_binding.dart';
import 'app_routes.dart';

class AuthPages {
  static List<GetPage> routes({
    required SupabaseClient supabaseClient,
  }) {
    return [
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding(supabaseClient: supabaseClient),
      ),
      GetPage(
        name: AppRoutes.signup,
        page: () => const SignUpPage(),
        binding: SignUpBinding(supabaseClient: supabaseClient),
      ),
    ];
  }
}
