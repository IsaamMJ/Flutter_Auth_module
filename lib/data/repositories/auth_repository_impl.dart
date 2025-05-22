import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/user.dart' as local;
import '../../domain/entities/credentials.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _client;

  AuthRepositoryImpl(this._client);

  @override
  Future<local.User?> signUp(Credentials credentials) async {
    try {
      final response = await _client.auth.signUp(
        email: credentials.email,
        password: credentials.password,
      );

      final supaUser = response.user;
      if (supaUser == null) return null;

      return local.User(
        id: supaUser.id,
        email: supaUser.email ?? '',
      );
    } catch (e) {
      print('Signup failed: $e');
      return null;
    }
  }

  @override
  Future<local.User?> login(Credentials credentials) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: credentials.email,
        password: credentials.password,
      );

      final supaUser = response.user;
      if (supaUser == null) return null;

      return local.User(
        id: supaUser.id,
        email: supaUser.email ?? '',
      );
    } catch (e) {
      print('Login failed: $e');
      return null;
    }
  }
}
