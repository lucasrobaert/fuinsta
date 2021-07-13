import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fuinsta/app/constants.dart';
import 'package:fuinsta/app/modules/onboarding/onboarding_store.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  const OnboardingPage({Key? key, this.title = 'FuInsta'}) : super(key: key);
  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState
    extends ModularState<OnboardingPage, OnboardingStore> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          _OnboardingItem(
              image: AssetImage('assets/onboarding1.png'),
              text: 'Compartilhe e veja fotos dos seus amigos!'),
          _OnboardingItem(
              image: AssetImage('assets/onboarding2.png'),
              text: 'Compartilhe e veja fotos dos seus amigos!'),
          _OnboardingItem(
            image: AssetImage('assets/onboarding3.png'),
            text: 'Compartilhe e veja fotos dos seus amigos!',
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      store.markOnboardingDone();
                      Modular.to
                          .pushReplacementNamed(Constants.Routes.REGISTER);
                    },
                    child: Text('Cadastre-se')),
                TextButton(
                    onPressed: () {
                      store.markOnboardingDone();
                      store.markRegisterDone();
                      Modular.to.pushReplacementNamed(Constants.Routes.LOGIN);
                    },
                    child: Text('Já tem cadastro?'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingItem extends StatelessWidget {
  final ImageProvider image;
  final String text;
  final Widget? child;
  _OnboardingItem({required this.image, required this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: MediaQuery.of(context).padding.bottom + 96),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Image(
            image: image,
            fit: BoxFit.fitWidth,
          )),
          SizedBox(
            height: 32,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
          child ??
              SizedBox.fromSize(
                size: Size.zero,
              )
        ],
      ),
    );
  }
}
