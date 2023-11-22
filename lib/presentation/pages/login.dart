import 'package:aci_rezeki_shop_mobile/domain/usecases/login_use_case.dart';
import 'package:aci_rezeki_shop_mobile/main.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/register.dart';
import 'package:aci_rezeki_shop_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/input_text_field.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginUseCase = getIt<LoginUseCase>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onSubmit() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final response = await loginUseCase.execute(username, password);
    if (response.status) {
      String message = response.message;
      String uname = response.username!;
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(navigatorKey.currentContext!)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("$message Welcome, $uname.")));
    } else {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: Text(response.message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aci Rezeki Shop')),
      body: Column(
        children: [
          InputTextField(
            name: 'username',
            controller: _usernameController,
          ),
          const SizedBox(
            height: 12.0,
          ),
          InputTextField(
            name: 'password',
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(onPressed: onSubmit, child: const Text('Login')),
          Row(children: [
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: const Text('Register'),
            ),
          ]),
        ],
      ),
    );
  }
}
