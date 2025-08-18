import 'package:desenvolvimento_flutter_iniciante/states/messages_states.dart';
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
    pessoaController.listarPessoas();
    themeController.mensagemNotifier.addListener(_onThemeMensagem);
    pessoaController.mensagemNotifier.addListener(_onPessoaMensagem);

    super.initState();
  }

  void _onThemeMensagem() {
    ScaffoldMessenger.of(context).clearSnackBars();
    final value = themeController.mensagemNotifier.value;
    if (value is SuccessMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(value.message),
        ),
      );
    } else if (value is ErrorMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(value.message),
        ),
      );
    }
  }

  void _onPessoaMensagem() {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (pessoaController.mensagemNotifier.value is SuccessMessage) {
      final value = pessoaController.mensagemNotifier.value as SuccessMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(value.message),
        ),
      );
    } else if (pessoaController.mensagemNotifier.value is ErrorMessage) {
      final value = pessoaController.mensagemNotifier.value as ErrorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(value.message),
        ),
      );
    }
  }

  @override
  void dispose() {
    pessoaController.mensagemNotifier.removeListener(_onPessoaMensagem);
    themeController.mensagemNotifier.removeListener(_onThemeMensagem);
    super.dispose();
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
          if (pessoaController.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListaPessoas(
              pessoas: pessoaController.pessoas,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.criarPessoaPage);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
