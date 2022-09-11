import 'package:flutter/material.dart';

class ItemBasket extends StatelessWidget {
  final int id;
  final int count;
  ItemBasket(this.id, this.count);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Cart"),
      ),
      body: Center(
        child: Text("Item $id count = $count"),
      ),
    );
  }
}
