import 'package:aci_rezeki_shop_mobile/data/models/auth_response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/logout_use_case.dart';
import 'package:aci_rezeki_shop_mobile/main.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/list_items.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/login.dart';
import 'package:aci_rezeki_shop_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/left_drawer.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/menu_card.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/add_item_form.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          context: _scaffoldKey.currentContext!,
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

    final List<MenuItem> items = [
      MenuItem(
          name: "View Items",
          icon: Icons.checklist,
          color: const Color(0xffef3f37),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListItemsPage()));
          }),
      MenuItem(
          name: "Add Item",
          icon: Icons.add_shopping_cart,
          color: const Color(0xff262161),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddItemForm()));
          }),
      MenuItem(
          name: "Logout",
          icon: Icons.logout,
          color: const Color(0xfffbaf41),
          onTap: logout),
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Aci Rezeki Shop',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Aci Rezeki Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((MenuItem item) {
                  // Iterasi untuk setiap item
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
