import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/features/main/data/models/menu_item.dart';
import 'package:aci_rezeki_shop_mobile/features/main/presentation/widget/menu_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<MenuItem> items = [
    MenuItem("Lihat Item", Icons.checklist, const Color(0xffef3f37)),
    MenuItem("Tambah Item", Icons.add_shopping_cart, const Color(0xff262161)),
    MenuItem("Logout", Icons.logout, const Color(0xfffbaf41)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
      ),
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
                  'PBP Shop', // Text yang menandakan toko
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
