import 'package:desenvolvimento_flutter_iniciante/states/messages_states.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  bool darkTheme = false;

  ThemeController({required this.sharedPreferences});

  ValueNotifier<MessagesStates> mensagemNotifier =
      ValueNotifier(IddleMessage());

  void toggleTheme(bool value) async {
    try {
      // throw Exception("Ocorreu um erro ao alterar o tema");
      darkTheme = !darkTheme;
      await sharedPreferences.setBool("theme", darkTheme);
      mensagemNotifier.value = SuccessMessage(
          "Tema alterado para ${darkTheme ? "Escuro" : "Claro"}");
      notifyListeners();
    } catch (error) {
      mensagemNotifier.value = ErrorMessage(error.toString());
      notifyListeners();
    }
  }

  Future<void> getTheme() async {
    final theme = sharedPreferences.getBool("theme");
    if (theme != null) {
      darkTheme = theme;
      notifyListeners();
    }
  }
}
