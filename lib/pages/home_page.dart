import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/pessoa_controller.dart';
import '../routes/routes.dart';
import '../widgets/lista_pessoas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();

  @override
  void initState() {
    super.initState();
    // pessoaController.addListener(listener);
  }

  // void listener() {
  //   setState(() {});
  // }

  @override
  void dispose() {
    super.dispose();
    // pessoaController.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.criarPessoaPage);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
