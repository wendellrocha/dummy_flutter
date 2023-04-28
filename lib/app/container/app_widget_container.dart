import 'package:get_it/get_it.dart';

import '../../shared/adapters/dio_adapter.dart';
import '../../shared/adapters/http_client_adapter.dart';

class AppWidgetContainer {
  static void init() {
    GetIt.I.registerLazySingleton<IHttpClientAdapter>(() => DioAdapter());
  }
}
