import 'package:flutter/material.dart';

import '../pages/criar_pessoa_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.criarPessoaPage: (BuildContext context) {
    final params =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final pessoa = params?['pessoa'];
    return CriarPessoaPage(
      pessoa: pessoa,
    );
  },
};
