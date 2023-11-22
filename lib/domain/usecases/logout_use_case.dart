// create LogoutUseCase class

import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  late AuthRepository _authRepository;

  LogoutUseCase({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  Future<AuthResponseModel> execute() async {
    try {
      return await _authRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}
