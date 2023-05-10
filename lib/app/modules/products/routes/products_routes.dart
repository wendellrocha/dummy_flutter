import 'package:go_router/go_router.dart';
import 'package:scaffold/scaffold.dart';

import '../domain/entities/product_model.dart';
import '../pages/product_details/product_details_page.dart';
import '../products_page.dart';

class ProductsRoutes extends Routes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/products',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProductsPage(),
          ),
          routes: [
            GoRoute(
              path: 'product/details/:id/:title',
              builder: (context, state) => ProductDetailsPage(
                id: state.pathParameters['id']!,
                product: state.extra as ProductModel,
              ),
            ),
          ],
        ),
      ];
}
