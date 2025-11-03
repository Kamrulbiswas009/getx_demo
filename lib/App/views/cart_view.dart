import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Obx(
        () => ListView(
          children: cartController.cartItems
              .map(
                (item) => ListTile(
                  title: Text(item.name),
                  subtitle: Text("৳${item.price}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () => cartController.remove(item),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: EdgeInsets.all(20),
          color: Colors.blueAccent,
          child: Text(
            "Total: ৳${cartController.total.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
