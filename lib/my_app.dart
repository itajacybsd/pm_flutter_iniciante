import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controllers/theme_controller.dart';
import 'routes/router.dart';
import 'routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    super.initState();
    //carregando o tema salvo
    //para que o tema seja carregado antes de renderizar o app
    themeController.getTheme();
  }
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: themeController,
        builder: (context, child) {
          return MaterialApp(
            initialRoute: Routes.initialRoute,
            routes: routes,
            title: 'Flutter Demo',
            theme: themeController.darkTheme ? darkTheme : lightTheme,
          );
        });
  }
}
