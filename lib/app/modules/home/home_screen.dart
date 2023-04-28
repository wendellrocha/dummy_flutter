import 'package:flutter/material.dart';

import '/shared/utils/drawer_items.dart';
import '/shared/widgets/default_app_bar/default_app_bar_widget.dart';
import '/shared/widgets/drawer/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Widget child;
  const HomeScreen({this.title = 'Home', required this.child, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      drawer: DrawerWidget(items: DrawerItems.items),
      body: widget.child,
    );
  }
}
