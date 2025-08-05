// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:desenvolvimento_flutter_iniciante/models/pessoa.dart';
import 'package:desenvolvimento_flutter_iniciante/widgets/custom_person_tile.dart';

class ListaPessoas extends StatelessWidget {
  final Function(Pessoa pessoa) onDeletePessoa;
  List<Pessoa> pessoas;
  // final Function onDeletePessoa;
  ListaPessoas({
    super.key,
    required this.pessoas,
    required this.onDeletePessoa,
  });

  @override
  Widget build(BuildContext context) {
    // final pessoas = gerarPessoas(20);

    if (pessoas.isEmpty) {
      return Center(
        child: Text(
          "Nenhuma pessoa cadastrada.",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      );
    }

    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return CustomPersonTile(
          pessoa: pessoas[index],
          onDeletePessoa: onDeletePessoa,
        );
      },
    );
  }
}
