import 'package:flutter/material.dart';
import 'package:food_order_app/providers/foods.dart';
import 'package:food_order_app/providers/food.dart';
import '../providers/food.dart';
import 'package:provider/provider.dart';

class UserFoodItem extends StatelessWidget {
  //final String title;
  //final String imgUrl;
  final Food food;

  //UserFoodItem(this.title, this.imgUrl);
  UserFoodItem(
    this.food,
  );

  @override
  Widget build(BuildContext context) {
    Provider.of<Foods>(
      context,
    );

    return ListTile(
      title: Text(food.title),
      leading: CircleAvatar(
        backgroundImage: AssetImage(food.imgUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {},
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
