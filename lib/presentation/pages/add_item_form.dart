import 'package:aci_rezeki_shop_mobile/data/models/response_model.dart';
import 'package:aci_rezeki_shop_mobile/domain/entities/item.dart';
import 'package:aci_rezeki_shop_mobile/domain/usecases/create_item_use_case.dart';
import 'package:aci_rezeki_shop_mobile/presentation/pages/home.dart';
import 'package:aci_rezeki_shop_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/left_drawer.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/input_text_field.dart';
import 'package:aci_rezeki_shop_mobile/presentation/widget/input_number_field.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm({super.key});

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  CreateItemUseCase createItemUseCase = getIt<CreateItemUseCase>();

  Future<ResponseModel> createItem() async {
    return await createItemUseCase.execute(
      Item(
        name: _name,
        price: _price,
        amount: _amount,
        description: _description,
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  int _price = 0;
  // String _image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Product Form',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputTextField(
                  name: "Name",
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  }),
              InputNumberField(
                  name: "Price",
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  }),
              InputNumberField(
                name: "Amount",
                onChanged: (String? value) {
                  setState(() {
                    _price = int.parse(value!);
                  });
                },
              ),
              InputTextField(
                  name: "Description",
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await createItem();
                        if (response.status == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("New item has been added!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("Something wrong, please try again later"),
                          ));
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
