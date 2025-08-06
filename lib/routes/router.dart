import 'package:flutter/material.dart';

import '../pages/criar_pessoa_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.criarPessoaPage: (BuildContext context) => CriarPessoaPage(),
};
