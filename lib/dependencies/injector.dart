import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/pessoa_controller.dart';
import '../services/api_client.dart';

Future<void> injector() async {
  final i = GetIt.instance;

 

  i.registerFactory(
    () => ApiClient(dio: Dio(), apiUrl: "http://192.168.7.7:3000/pessoas"),
  );

  i.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  i.registerSingleton<PessoaController>(
      PessoaController(apiClient: i<ApiClient>()));

  i.registerSingleton<ThemeController>( 
    ThemeController(
      sharedPreferences: i<SharedPreferences>(),
    ),
  );
}
