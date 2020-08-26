import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage() {
    sleep(10);
    Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
  }

  void sleep(int seconds) async {
    return await Future.delayed(Duration(seconds: seconds));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
