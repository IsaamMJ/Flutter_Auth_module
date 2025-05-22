library auth_module;

export 'presentation/pages/login_page.dart';
export 'presentation/pages/signup_page.dart';
export 'presentation/bindings/login_binding.dart';
export 'presentation/bindings/signup_binding.dart';
export 'routes/auth_pages.dart';     // ✅ GetX pages
export 'routes/app_routes.dart';     // ✅ contains AuthRoutes
export 'package:auth_module/auth_module_config.dart';      // ✅ contains AuthModule.init()
