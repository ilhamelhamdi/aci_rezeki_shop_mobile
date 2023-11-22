import 'package:aci_rezeki_shop_mobile/data/datasources/auth_datasource.dart';
import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  late AuthDatasource _remoteDatasource;

  AuthRepositoryImpl({required AuthDatasource datasource}) {
    _remoteDatasource = datasource;
  }

  @override
  Future<AuthResponseModel> login(String username, String password) async {
    return await _remoteDatasource.login(username, password);
  }

  @override
  Future<AuthResponseModel> logout() async {
    return await _remoteDatasource.logout();
  }

  @override
  Future<AuthResponseModel> register(
      String username, String password, String confirmPassword) async {
    return await _remoteDatasource.register(username, password, confirmPassword);
  }
}
