import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/binding/init_bindings.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/pages/ScreenB.dart';
import 'package:mobile/pages/Join.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko'),
        const Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Login(),
        ),
        GetPage(
          name: '/home',
          page: () => ScreenB(),
        ),
        GetPage(
          name: '/join',
          page: () => Join(),
        ),
      ],
      initialBinding: InitBinding(),
    );
  }
}
