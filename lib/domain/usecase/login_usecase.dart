import '../entities/user.dart';
import '../entities/credentials.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User?> execute(Credentials credentials) {
    return repository.login(credentials);
  }
}
