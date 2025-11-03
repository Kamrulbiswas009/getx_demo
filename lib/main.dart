import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'App/views/product_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductView(),
    );
  }
}
