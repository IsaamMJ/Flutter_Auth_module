import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDataSource {
  final SupabaseClient client;
  SupabaseAuthDataSource(this.client);

  Future<AuthResponse> login(String email, String password) =>
      client.auth.signInWithPassword(email: email, password: password);

  Future<AuthResponse> signUp(String email, String password) =>
      client.auth.signUp(email: email, password: password);
}
