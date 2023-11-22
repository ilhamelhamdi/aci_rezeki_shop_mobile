// create RegisterUseCase class

import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  late AuthRepository _authRepository;

  RegisterUseCase({required AuthRepository authRepository}) {
    _authRepository = authRepository;
  }

  Future<AuthResponseModel> execute(String username, String password, String confirmPassword) async {
    try {
      return await _authRepository.register(username, password, confirmPassword);
    } catch (e) {
      rethrow;
    }
  }
}