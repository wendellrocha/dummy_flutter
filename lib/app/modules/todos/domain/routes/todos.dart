import 'package:go_router/go_router.dart';

import '/shared/utils/routes/routes.dart';
import '../../todos_page.dart';

class TodosRoutes implements Routes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/todos',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TodosPage(),
          ),
        )
      ];
}
