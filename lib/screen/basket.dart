import 'package:flutter/material.dart';
import 'package:hello_world/screen/itembasket.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Text("This is Cart"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ItemBasket(1, 10)));
              },
              child: Text("Item 1")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ItemBasket(2, 14)));
              },
              child: Text("Item 2")),
        ],
      ),
    );
  }
}
