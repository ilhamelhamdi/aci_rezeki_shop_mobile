// create LogoutUseCase class

import 'package:aci_rezeki_shop_mobile/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  late AuthRepository _authRepository;

  LogoutUseCase({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  Future<void> execute() async {
    try {
      await _authRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}