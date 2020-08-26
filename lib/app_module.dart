import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'package:dailypet/core/pages/splash_screen_page.dart';
import 'package:dailypet/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SplashScreenPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
