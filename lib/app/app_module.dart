import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fuinsta/app/constants.dart';
import 'package:fuinsta/app/modules/home/home_module.dart';
import 'package:fuinsta/app/modules/login/login_module.dart';
import 'package:fuinsta/app/modules/onboarding/onboarding_module.dart';
import 'package:fuinsta/app/modules/register/register_module.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppModule extends Module {

  SharedPreferences _sharedPreferences;
  FirebaseApp _firebaseApp;
  AppModule(this._sharedPreferences, this._firebaseApp);

  @override
   List<Bind> get binds => [
    Bind.singleton((i) => _sharedPreferences),
    Bind.instance((i) => _firebaseApp),
    Bind.factory((i) => FirebaseAuth.instance),
  ];

  @override
   List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: _initialModule()),
    ModuleRoute(Constants.Routes.ONBOARDING, module: OnboardingModule()),
    ModuleRoute(Constants.Routes.REGISTER, module: RegisterModule(), transition: TransitionType.rightToLeftWithFade),
    ModuleRoute(Constants.Routes.HOME, module: HomeModule()),
    ModuleRoute(Constants.Routes.LOGIN, module: LoginModule())
  ];

  Module _initialModule(){
    final onboardingDone = _sharedPreferences.getBool(Constants.SPK_ONBOARDING_DONE) ?? false;

    if(onboardingDone){
      final registerDone = _sharedPreferences.getBool(Constants.SPK_REGISTER_DONE) ?? false;
      if(registerDone){
        return LoginModule();
      }else{
        return RegisterModule();
      }
    }else{
      return OnboardingModule();
    }
  }

}