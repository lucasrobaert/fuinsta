import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {

  SharedPreferences _sharedPreferences;
  AppModule(this._sharedPreferences);

  @override
   List<Bind> get binds => [
    Bind.singleton((i) => _sharedPreferences)
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];

}