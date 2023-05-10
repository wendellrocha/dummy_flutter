import 'package:flutter/material.dart';

import '../models/menu_item_model.dart';

class DrawerItems {
  static final List<MenuItemModel> items = List.from(
    [
      const MenuItemModel(
        icon: Icons.task,
        title: 'To-do',
        route: '/todos',
      ),
      const MenuItemModel(
        icon: Icons.inventory_sharp,
        title: 'Products',
        route: '/products',
      ),
      const MenuItemModel(
        icon: Icons.post_add,
        title: 'Posts',
        route: '/comments',
      ),
      const MenuItemModel(
        icon: Icons.format_quote,
        title: 'Quotes',
        route: '/quotes',
      ),
    ],
    growable: false,
  );

  static const MenuItemModel logoutItem = MenuItemModel(
    icon: Icons.logout,
    title: 'Logout',
    route: '/auth/',
  );
}
