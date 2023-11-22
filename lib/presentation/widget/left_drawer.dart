import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/logout_use_case.dart';
import 'package:aci_rezeki_shop_mobile/main.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/list_items.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/login.dart';
import 'package:aci_rezeki_shop_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/home.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/add_item_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  void logout() async {
    LogoutUseCase logoutUseCase = getIt<LogoutUseCase>();
    AuthResponseModel response = await logoutUseCase.execute();
    if (response.status) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(const SnackBar(
        content: Text("Logout successfully!"),
      ));
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Logout Failed'),
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
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              children: [
                Text(
                  'Aci Rezeki Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddItemForm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('View Items'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListItemsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListItemsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
