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
        name: AuthRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding(
          supabaseClient: supabaseClient,
        ),
        preventDuplicates: true,
      ),
      GetPage(
        name: AuthRoutes.signup,
        page: () => const SignUpPage(),
        binding: SignUpBinding(supabaseClient: supabaseClient),
      ),
    ];
  }
}
