abstract class Constants{

  // SPK = Shared Preferences Key
  static const SPK_ONBOARDING_DONE = 'OnboardingDone';
  static const SPK_REGISTER_DONE = 'RegisterDone';

  static final Routes = _Routes();

}

class _Routes{

  final ONBOARDING = '/onboarding';
  final REGISTER = '/register';
  final HOME = '/';
  final LOGIN = '/login';
  final FORGOT_PASSWORD = '/login/forgot-password';

}