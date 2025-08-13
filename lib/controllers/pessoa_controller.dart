import 'package:desenvolvimento_flutter_iniciante/states/messages_states.dart';
import 'package:flutter/material.dart';

import '../models/criar_pesso_dto.dart';
import '../models/pessoa.dart';
import '../services/api_client.dart';

class PessoaController extends ChangeNotifier {
  List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  final ApiClient apiClient = ApiClient();

  ValueNotifier<MessagesStates> mensagemNotifier =
      ValueNotifier(IddleMessage());

  bool _loading = false;
  bool get loading => _loading;

  void listarPessoas() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      final pessoas = await apiClient.get();
      _pessoas = pessoas;
    } on Exception catch (error) {
      // TODO : TRATAMENTO DE ERROS
      print('error ao listar pessoas: $error');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void adicionarPessoa(CriarPessoaDto criarPessoa) async {
    try {
      // throw Exception();
      // final pessoa =
      // Pessoa(
      //   id: (_pessoas.length + 1).toString(),
      //   nome: criarPessoa.nome,
      //   altura: criarPessoa.altura,
      //   peso: criarPessoa.peso,
      // );

      final pessoa = await apiClient.post(criarPessoa);

      _pessoas.add(pessoa);
      mensagemNotifier.value = SuccessMessage("Pessoa adicionada com sucesso!");
      notifyListeners();
    } catch (error) {
      mensagemNotifier.value =
          ErrorMessage("Ocorreu um erro ao adicionar pessoa: $error");
      return;
    }
  }

  void removerPessoa(Pessoa pessoa) async {
    try {
      await apiClient.delete(pessoa);
      _pessoas.remove(pessoa);
      mensagemNotifier.value = SuccessMessage("Pessoa removida com sucesso!");
      notifyListeners();
    } on Exception catch (error) {
    } finally {
      notifyListeners();
    }
  }
}
