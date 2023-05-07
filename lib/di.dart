import 'package:get_it/get_it.dart';

import 'index.dart';

GetIt di = GetIt.instance;

Future<void> diInit() async {
  // CONTROLLERS
  di.registerFactory<AuthController>(() => AuthController());
  di.registerFactory<HomeController>(() => HomeController());

  await di.allReady();
}
