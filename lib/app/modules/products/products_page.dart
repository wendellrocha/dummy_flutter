import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'products_container.dart';
import 'products_controller.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final container = ProductsContainer();
  late final ProductsController controller;

  @override
  void initState() {
    super.initState();
    container.init();
    controller = GetIt.I.get<ProductsController>();
    controller.fetchProducts();
  }

  @override
  void dispose() {
    container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
