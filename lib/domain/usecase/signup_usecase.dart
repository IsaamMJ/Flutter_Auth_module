import '../entities/user.dart';
import '../entities/credentials.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User?> execute(Credentials credentials) {
    return repository.signUp(credentials);
  }
}
