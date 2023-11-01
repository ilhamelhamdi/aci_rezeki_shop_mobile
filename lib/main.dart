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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// Reference of Clean Architecture Folder Structure:
// https://dev.to/marwamejri/flutter-clean-architecture-1-an-overview-project-structure-4bhf