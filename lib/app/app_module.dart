import 'package:flutter_modular/flutter_modular.dart';
import 'package:fuinsta/app/constants.dart';
import 'package:fuinsta/app/modules/onboarding/onboarding_module.dart';
import 'package:fuinsta/app/modules/register/register_module.dart';
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
   List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: _initialModule()),
    ModuleRoute(Constants.Routes.ONBOARDING, module: OnboardingModule()),
    ModuleRoute(Constants.Routes.REGISTER, module: RegisterModule())
  ];

  Module _initialModule(){
    final onboardingDone = _sharedPreferences.getBool(Constants.SPK_ONBOARDING_DONE) ?? false;

    if(onboardingDone){
      return RegisterModule();
    }else{
      return OnboardingModule();
    }
  }

}