import 'package:flutter/material.dart';
import 'package:food_order_app/providers/foods.dart';
import 'package:food_order_app/providers/food.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  static const routeName = '/addItem';

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  //late String textName;

  late Foods foodList;

  final itemNameController = TextEditingController();

  final itemDescriptionController = TextEditingController();

  final itemPriceController = TextEditingController();

  final itemUrlController = TextEditingController();

  void savedItemToList() {
    print(
        'savedItemToList ${itemDescriptionController.text},${itemUrlController.text},${itemPriceController.text}');

    Food food = Food(
      title: itemNameController.text,
      description: itemDescriptionController.text,
      price: double.parse(itemPriceController.text),
      imgUrl: itemUrlController.text,
      id: '',
    );
    foodList.addFood(food);
  }

  @override
  Widget build(BuildContext context) {
    //return foods items
    foodList = Provider.of<Foods>(context,);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              controller: itemNameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              //onChanged: (value) => textName = value,
              decoration: InputDecoration(
                hintText: 'Enter Item Name',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: itemDescriptionController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Enter Item Description',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                labelText: 'Description',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: itemUrlController,
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Enter Item Image',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                labelText: 'Image',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: itemPriceController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'Enter Item Price',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                labelText: 'Price',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  savedItemToList();
                },
                child: Text('Save'))
          ],
        )),
      ),
    );
  }
}
