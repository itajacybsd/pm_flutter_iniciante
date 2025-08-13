import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';
import 'package:dio/dio.dart';

import '../models/pessoa.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<List<Pessoa>> get() async {
    final request = await dio.get("http://192.168.7.8:3000/pessoas");

    if (request.statusCode == 200) {
      final data = request.data;
      final pessoasJson = data as List;

      return pessoasJson
          .map((pessoaJson) => Pessoa.fromJson(pessoaJson))
          .toList();
    }
    throw Exception('Status Code inbválido');
  }

  Future<Pessoa> post(CriarPessoaDto criarPessoa) async {
    final request = await dio.post("http://192.168.7.8:3000/pessoas",
        data: criarPessoa.toJson());

    if (request.statusCode == 201) {
      return Pessoa.fromJson(request.data);
    }
    throw Exception('Status Code inbválido');
  }

  Future<void> delete(Pessoa pessoa) async {
    final request =
        await dio.delete("http://192.168.7.8:3000/pessoas/${pessoa.id}");

    if (request.statusCode != 200) {
      throw Exception('Status Code inválido');
    }
    // return;
  }


}
