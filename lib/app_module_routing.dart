import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/presentation.dart';

/// HomeRoutes
abstract class AppModuleRouting {
  /// module
  static const BasePath splash = BasePath('/');

  static const BasePath root = BasePath('/home');

  static const BasePath detail = BasePath('/detail');

  ///
  /// Module routes definitions
  ///
  static List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const SplashPage(),
        ),
        ChildRoute(
          root.path,
          child: (_, __) => const HomePage(),
        ),
        ChildRoute(
          detail.path,
          child: (_, args) =>   DetailPage(id: args.data),
        ),
      ];
}
