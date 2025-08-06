import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:get_it/get_it.dart';

import '../controllers/pessoa_controller.dart';

void injector() {
  final i = GetIt.instance;

  i.registerSingleton<PessoaController>(PessoaController());
  i.registerSingleton<ThemeController>(ThemeController());
}
