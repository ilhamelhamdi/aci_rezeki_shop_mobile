import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/get_item_list_use_case.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/left_drawer.dart';
import 'package:aci_rezeki_shop_mobile/service_locator.dart';
import 'package:flutter/material.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({super.key});

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  GetItemListUseCase getItemListUseCase = getIt<GetItemListUseCase>();

  Future<List<Item>> fetchItems() async {
    return await getItemListUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItems(),
            builder: (context, AsyncSnapshot<List<Item>> snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Center(
                      child: Text(
                        "There is no item.",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Price: Rp ${snapshot.data![index].price}"),
                                const SizedBox(height: 10),
                                Text("Amount: ${snapshot.data![index].amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "Deskription: ${snapshot.data![index].description}")
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
