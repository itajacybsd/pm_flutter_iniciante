import 'package:flutter/material.dart';

import '../models/pessoa.dart';
import 'custom_person_tile.dart';

class ListaPessoas extends StatelessWidget {
  final List<Pessoa> pessoas;

  const ListaPessoas({
    super.key,
    required this.pessoas,
  });

  @override
  Widget build(BuildContext context) {
    if (pessoas.isEmpty) {
      return Center(
        child: Text(
          "Nenhuma pessoa cadastrada",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return CustomPersonTile(
          pessoa: pessoas[index],
        );
      },
    );
  }
}
