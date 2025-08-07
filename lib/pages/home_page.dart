import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/pessoa_controller.dart';
import '../controllers/theme_controller.dart';
import '../routes/routes.dart';
import '../widgets/pessoa/lista_pessoas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();
  final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    themeController.mensagemNotifier.addListener(_onThemeMensagem);
    pessoaController.mensagemNotifier.addListener(_onPessoaMensagem);
    super.initState();
    // pessoaController.addListener(listener);
  }

  void _onThemeMensagem() {
    print("Mensagem: ${themeController.mensagemNotifier.value}");
  }

  void _onPessoaMensagem() {
    print("Mensagem: ${pessoaController.mensagemNotifier.value}");
  }

  // void listener() {
  //   setState(() {});
  // }

  @override
  void dispose() {
    pessoaController.mensagemNotifier.removeListener(_onPessoaMensagem);
    themeController.mensagemNotifier.removeListener(_onThemeMensagem);
    super.dispose();
    // pessoaController.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
                value: themeController.darkTheme,
                onChanged: (value) {
                  themeController.toggleTheme(value);
                }),
            Text("Tema Escuro"),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Meu primeiro App."),
      ),
      body: ListenableBuilder(
        listenable: pessoaController,
        builder: (context, child) {
          return ListaPessoas(
            pessoas: pessoaController.pessoas,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.criarPessoaPage);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
