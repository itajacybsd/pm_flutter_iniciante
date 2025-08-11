import 'package:dio/dio.dart';

import '../models/pessoa.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<List<Pessoa>> get() async {
    final request = await dio.get("http://localhost:3000/pessoas");

    if (request.statusCode == 200) {
      final data = request.data;
      final pessoasJson = data as List<Map<String, dynamic>>;

      return pessoasJson.map((pessoaJson) => Pessoa(
            id: pessoaJson['id'],
            nome: pessoaJson['nome'],
            altura: pessoaJson['altura'],
            peso: pessoaJson['peso'],
          )).toList();
    }
    throw Exception('Status Code inbválido');
  }
}
