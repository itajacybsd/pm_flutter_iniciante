import 'package:flutter/material.dart';

import '../../models/pessoa.dart';
import '../core/custom_tile.dart';
import 'pessoa_dialog.dart';

class CustomPersonTile extends StatelessWidget {
  final Pessoa pessoa;
  const CustomPersonTile({
    super.key,
    required this.pessoa,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return PessoaDialog(
              pessoa: pessoa,
            );
          },
        );
      },
      color: Theme.of(context).primaryColor,
      leading: Text("Id: ${pessoa.id}"),
      title: Text(
        pessoa.nome,
        style: TextStyle(fontSize: 20),
      ),
      subTitle: Text("Peso: ${pessoa.peso.toStringAsFixed(1)} Kg"),
      trailing: Text("Altura: ${pessoa.altura} cm"),
    );
  }
}
