import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'routes/app_routes.dart';
import 'package:auth_module/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Supabase for module preview
  await Supabase.initialize(
    url: 'https://rdjdvatbbhwwzjtqvdru.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJkamR2YXRiYmh3d3pqdHF2ZHJ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc0NTY5MjUsImV4cCI6MjA2MzAzMjkyNX0.JG2obBbs78w3WpIjXwT91SvpHIsC7H8axnw7mpfepWA',
  );

  runApp(const AuthPreviewApp());
}

class AuthPreviewApp extends StatelessWidget {
  const AuthPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Module Preview',
      initialRoute: AppRoutes.login,
      getPages: AuthPages.routes(
        supabaseClient: Supabase.instance.client,
      ),
    );
  }
}
