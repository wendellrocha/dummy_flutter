import 'dart:developer' as devtools show log;

import 'package:get_it/get_it.dart';

typedef Injection = void Function(GetIt);

abstract class InjectionContainer {
  final String scope;

  const InjectionContainer({required this.scope});

  List<Injection> get binds => const [];

  void init() {
    GetIt.I.pushNewScope(
      scopeName: scope,
      init: (i) {
        for (final instance in binds) {
          instance.call(i);
        }
      },
    );
    devtools.log('~~~> $scope initialized');
  }

  void dispose() {
    GetIt.I.popScopesTill(scope, inclusive: true);
    devtools.log('~~~> $scope disposed');
  }
}
