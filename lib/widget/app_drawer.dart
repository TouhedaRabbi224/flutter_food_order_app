import 'package:flutter/material.dart';
import 'package:food_order_app/screen/food_list_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Ashfia Islam Nuha'),
            accountEmail: Text('ashfia369nuha@gmail.com'),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/nuha.jpg')),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/hello.jpg'),
              ),
              CircleAvatar(
                  backgroundImage: AssetImage('assets/images/beauty.jpg'))
            ],
          ),
          ListTile(
            title: Text('Shop'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Shop');
              // Navigator.push(context, MaterialPageRoute( builder: (cnx) {return Page1();}));
            },
          ),
          ListTile(
            title: Text('Order'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Orders');
              //Navigator.push(context, MaterialPageRoute(builder: (cnx) {return Page2();}));
            },
          ),
          ListTile(
            title: Text('Manage foods'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('manage foods');

              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => FoodlistScreen())));
            },
          ),
        ],
      ),
    );
  }
}
