import 'package:flutter/material.dart';
import 'package:item_app/screens/list.dart';

class ItemForm extends StatefulWidget {
  ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();

  // item controller
  final TextEditingController itemController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //item field
              Field(context, itemController, 'Item'),
              const SizedBox(
                height: 20,
              ),
              //Quantity field

              Field(context, quantityController, 'Quantity'),
              const SizedBox(
                height: 20,
              ),
              //rate field
              Field(context, rateController, 'Rate'),
              const SizedBox(
                height: 20,
              ),
              //add button

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var itemList = ListClass();
                    
                    itemList.addItem(
                      itemController.text,
                      int.parse(quantityController.text),
                      int.parse(rateController.text),
                    );
                    itemController.clear();
                    quantityController.clear();
                    rateController.clear();
                    print("Length ${itemList.getItem().length}");

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item Added')),
                    );
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField Field(BuildContext context, controller, hintLabel) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field can\'t be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: hintLabel,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF2F2F2),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF2F2F2),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        // prefixIcon: const Icon(Icons.menu),
        border: InputBorder.none,

        contentPadding: const EdgeInsets.fromLTRB(
          20.0,
          15.0,
          20.0,
          15.0,
        ),
      ),
    );
  }
}
