import 'package:aci_rezeki_shop_mobile/domain/usecases/register_use_case.dart';
import 'package:aci_rezeki_shop_mobile/main/presentation/widget/input_text_field.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/login.dart';
import 'package:aci_rezeki_shop_mobile/service_locator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerUseCase = getIt<RegisterUseCase>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void onSubmit() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    final response =
        await registerUseCase.execute(username, password, confirmPassword);
    if (response.status) {
      String message = response.message;
      String uname = response.username!;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("$message. Please login with username: $uname.")));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Failed'),
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
          InputTextField(
            name: 'confirmation password',
            controller: _confirmPasswordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton(onPressed: onSubmit, child: const Text('Register')),
          Row(children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () {
                MaterialPageRoute(builder: (context) => const LoginPage());
              },
              child: const Text('Login'),
            ),
          ]),
        ],
      ),
    );
  }
}
