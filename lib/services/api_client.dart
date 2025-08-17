// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import 'package:desenvolvimento_flutter_iniciante/models/criar_pesso_dto.dart';

import '../models/pessoa.dart';

class ApiClient {
  // final Dio dio = Dio();
  final Dio dio;
  final String apiUrl;
  
  ApiClient({
    required this.dio,
    required this.apiUrl,
  });

  // final apiUrl = "http://192.168.7.7:3000/pessoas";

  Future<List<Pessoa>> get() async {
    final request = await dio.get(apiUrl);

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
    final request = await dio.post(apiUrl, data: criarPessoa.toJson());

    if (request.statusCode == 201) {
      return Pessoa.fromJson(request.data);
    }
    throw Exception('Status Code inbválido');
  }

  Future<void> delete(Pessoa pessoa) async {
    final request = await dio.delete("$apiUrl/${pessoa.id}");

    if (request.statusCode != 200) {
      throw Exception('Status Code inválido');
    }
    // return;
  }

  Future<Pessoa> put(Pessoa pessoa) async {
    final request = await dio.put(
      "$apiUrl/${pessoa.id}",
      data: pessoa.toJson(),
    );

    if (request.statusCode == 200) {
      return Pessoa.fromJson(request.data);
    }
    throw Exception('Status Code inválido');
  }
}
