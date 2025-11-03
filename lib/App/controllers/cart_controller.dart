import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void add(Product product) => cartItems.add(product);
  void remove(Product product) => cartItems.remove(product);
  int get count => cartItems.length;
  double get total => cartItems.fold(0, (sum, p) => sum + p.price);
}
