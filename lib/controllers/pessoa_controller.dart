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

  Future<void> adicionarPessoa(CriarPessoaDto criarPessoa) async {
    try {

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

  Future<void> atualizarPessoa(Pessoa criarPessoa) async {
    try {
      final pessoa = await apiClient.put(criarPessoa);

      final pessoaIndex = _pessoas.indexWhere((p) => p.id == pessoa.id);
      // if (pessoaIndex != -1) {
      _pessoas[pessoaIndex] = pessoa;
      // }

      mensagemNotifier.value = SuccessMessage("Pessoa atualizada com sucesso!");
    } catch (error) {
      mensagemNotifier.value =
          ErrorMessage("Ocorreu um erro ao atualizar pessoa: $error");
      return;
    } finally {
      notifyListeners();
    }
  }



  void removerPessoa(Pessoa pessoa) async {
    try {
      await apiClient.delete(pessoa);
      _pessoas.remove(pessoa);
      mensagemNotifier.value = SuccessMessage("Pessoa removida com sucesso!");
      notifyListeners();
    } on Exception catch (error) {
      print('Erro ao remover pessoa: $error');
      mensagemNotifier.value =
          ErrorMessage("Ocorreu um erro ao remover pessoa: $error");
    } finally {
      notifyListeners();
    }
  }
}
