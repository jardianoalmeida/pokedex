import 'package:flutter_modular/flutter_modular.dart';

import 'app_module_bindings.dart';
import 'app_module_routing.dart';

///
/// Base app module definition
///
class AppModule extends Module {
  @override
  List<Bind> get binds => AppModuleBindings.binds;

  @override
  List<ModularRoute> get routes => AppModuleRouting.routes;
}
