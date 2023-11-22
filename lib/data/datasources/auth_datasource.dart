import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AuthDatasource {
  final CookieRequest client;
  AuthDatasource({required this.client});

  Future<AuthResponseModel> login(String username, String password) async {
    try {
      final Map<String, dynamic> response = await client.login(
        'https://aci-rezeki-shop.vercel.app/api/login/',
        {
          'username': username,
          'password': password,
        },
      );
      return AuthResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Error: Server error');
    }
  }

  Future<AuthResponseModel> logout() async {
    try {
      final Map<String, dynamic> response = await client.logout(
        'https://aci-rezeki-shop.vercel.app/api/logout/',
      );
      return AuthResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Error: Server error');
    }
  }

  // create register method
  Future<AuthResponseModel> register(
      String username, String password, String confirmPassword) async {
    try {
      final Map<String, dynamic> response = await client.post(
        'https://aci-rezeki-shop.vercel.app/api/register/',
        {
          'username': username,
          'password1': password,
          'password2': confirmPassword,
        },
      );
      return AuthResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Error: Server error');
    }
  }
}
