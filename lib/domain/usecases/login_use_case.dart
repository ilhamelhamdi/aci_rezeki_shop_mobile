// create LoginUseCase class

import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/auth_repository.dart';

class LoginUseCase {
  late AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  Future<AuthResponseModel> execute(String username, String password) async {
    try {
      return await _authRepository.login(username, password);
    } catch (e) {
      rethrow;
    }
  }
}
