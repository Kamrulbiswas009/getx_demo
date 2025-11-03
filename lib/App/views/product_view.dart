import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';
import 'cart_view.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final cartController = Get.put(CartController());

  final products = [
    Product(name: 'Apple', price: 120),
    Product(name: 'Orange', price: 80),
    Product(name: 'Banana', price: 50),
    Product(name: 'Mango', price: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Cart'),
        actions: [
          Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Get.to(() => CartView()),
                ),
                if (cartController.count > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartController.count.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(products[i].name),
          subtitle: Text('৳${products[i].price}'),
          trailing: ElevatedButton(
            onPressed: () => cartController.add(products[i]),
            child: Text('Add'),
          ),
        ),
      ),
    );
  }
}
