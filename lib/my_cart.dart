import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Center(
        child: Text(
          "Your Cart is Empty",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
