import 'package:envireonments_with_codemagic/app_widget.dart';
import 'package:envireonments_with_codemagic/config_reader.dart';
import 'package:envireonments_with_codemagic/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize();

  MaterialColor? primaryColor;
  String? appTitle;

  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      appTitle = ConfigReader.getDevTitle();
      break;
    case Environment.prod:
      primaryColor = Colors.red;

      appTitle = ConfigReader.getProdTitle();
      break;
  }

  runApp(Provider.value(
    value: AppConfig(primaryColor: primaryColor, appTitle: appTitle),
    child: MyApp(),
  ));
}

class AppConfig {
  final MaterialColor? primaryColor;
  final String? appTitle;

  AppConfig({required this.primaryColor, required this.appTitle});
}
