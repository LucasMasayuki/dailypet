import 'package:flutter/material.dart' hide Router;
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  @override
  Widget get bootstrap => Container();
}
