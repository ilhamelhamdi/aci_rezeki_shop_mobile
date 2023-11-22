import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> login(String username, String password);
  Future<AuthResponseModel> register(String username, String password, String confirmPassword);
  Future<AuthResponseModel> logout();
}
