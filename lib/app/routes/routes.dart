import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../modules/home/home_screen.dart';
import '../modules/posts/pages/post_details_page.dart';
import '../modules/posts/posts_page.dart';
import '../modules/products/routes/products.dart';
import '../modules/quotes/quotes_page.dart';
import '../modules/splash/splash_page.dart';
import '../modules/todos/routes/todos.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        ...TodosRoutes().routes,
        ...ProductsRoutes().routes,
        GoRoute(
          path: '/posts',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PostsPage(),
          ),
          routes: [
            GoRoute(
              path: 'details',
              builder: (context, state) => const PostDetails(),
            ),
          ],
        ),
        GoRoute(
          path: '/quotes',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: QuotesPage(),
          ),
        ),
      ],
    ),
  ],
);
