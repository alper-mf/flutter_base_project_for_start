// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/main/values/constants/http_url.dart';

import 'app/data/local_models/config/environment_config_model.dart';
import 'app/main/routing/screen_manager.dart';
import 'app/main/values/constants/app_constant.dart' as cons;

/// Tüm proje ortamları bu run Fon. nunu çağırmakta
Future run(EnvironmentConfigModel config) async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Initialize your HTTP base url and Web Socket Adress
  HttpUrl.baseUrl = config.apiBaseUrl;
  HttpUrl.webSocketAdress = config.socketUrl;

  debugPrint('HttpUrl.baseUrl: ${HttpUrl.baseUrl} \n Http.socketUrl: ${HttpUrl.webSocketAdress}');
  runApp(MyApp(appName: config.appName));
}

class MyApp extends StatelessWidget {
  final String? appName;
  const MyApp({Key? key, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      title: appName ?? cons.appName,
      onGenerateRoute: Screens.instance.main.onGenerateRoute,
    );
  }
}
