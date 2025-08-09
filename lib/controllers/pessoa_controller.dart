import 'package:desenvolvimento_flutter_iniciante/states/messages_states.dart';
import 'package:flutter/material.dart';

import '../models/criar_pesso_dto.dart';
import '../models/pessoa.dart';

class PessoaController extends ChangeNotifier {
  final List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  ValueNotifier<MessagesStates> mensagemNotifier =
      ValueNotifier(IddleMessage());

  void adicionarPessoa(CriarPessoaDto criarPessoa) {
    try {
      // throw Exception();
      final pessoa = Pessoa(
        id: _pessoas.length + 1,
        nome: criarPessoa.nome,
        altura: criarPessoa.altura,
        peso: criarPessoa.peso,
      );

      _pessoas.add(pessoa);
      mensagemNotifier.value = SuccessMessage("Pessoa adicionada com sucesso!");
      notifyListeners();
    } catch (error) {
      mensagemNotifier.value =
          ErrorMessage("Ocorreu um erro ao adicionar pessoa: $error");
      return;
    }
  }

  void removerPessoa(Pessoa pessoa) {
    _pessoas.remove(pessoa);
    mensagemNotifier.value = ErrorMessage("Pessoa removida com sucesso!");
    notifyListeners();
  }
}
