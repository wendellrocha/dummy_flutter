import 'package:flutter/material.dart';

import 'container/app_widget_container.dart';
import 'routes/routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    AppWidgetContainer.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dummy Flutter',
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
