import 'package:flutter_modular/flutter_modular.dart';
import 'package:fuinsta/app/modules/profile/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ProfilePage())
  ];

}