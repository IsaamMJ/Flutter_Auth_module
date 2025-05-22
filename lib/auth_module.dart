library auth_module;

// ✅ Expose only what's needed by the host app
export 'presentation/pages/login_page.dart';
export 'presentation/pages/signup_page.dart';

export 'presentation/bindings/login_binding.dart';
export 'presentation/bindings/signup_binding.dart';

export 'routes/auth_pages.dart';     // GetX route definitions
export 'routes/app_routes.dart';     // AuthRoutes (e.g., '/login', '/signup')
export 'auth_module_config.dart';      // AuthModule.init()
