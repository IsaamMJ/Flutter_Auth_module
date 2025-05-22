import '../entities/user.dart';
import '../entities/credentials.dart';

abstract class AuthRepository {
  Future<User?> login(Credentials credentials);
  Future<User?> signUp(Credentials credentials);
}
