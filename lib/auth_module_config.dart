import 'package:supabase_flutter/supabase_flutter.dart';

class AuthModuleConfig {
  final SupabaseClient supabaseClient;

  const AuthModuleConfig({
    required this.supabaseClient,
  });
}
