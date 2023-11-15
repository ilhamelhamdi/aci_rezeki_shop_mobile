import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/features/main/presentation/view/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aci Rezeki Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: const Color(0xff262161),
          secondary: const Color(0xffef3f37),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// Reference of Clean Architecture Folder Structure:
// https://dev.to/marwamejri/flutter-clean-architecture-1-an-overview-project-structure-4bhf