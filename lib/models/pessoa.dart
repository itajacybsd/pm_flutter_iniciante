// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pessoa {
  final String id;
  final String nome;
  final int altura;
  final double peso;

  const Pessoa({
    required this.id,
    required this.nome,
    required this.altura,
    required this.peso,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      id: json['id'] as String,
      nome: json['nome'] as String,
      altura: json['altura'] as int,
      peso: (json['peso'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'altura': altura,
      'peso': peso,
    };
  }

  Pessoa copyWith({
    String? id,
    String? nome,
    int? altura,
    double? peso,
  }) {
    return Pessoa(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'nome': nome,
  //     'altura': altura,
  //     'peso': peso,
  //   };
  // }

  // factory Pessoa.fromMap(Map<String, dynamic> map) {
  //   return Pessoa(
  //     id: map['id'] as String,
  //     nome: map['nome'] as String,
  //     altura: map['altura'] as int,
  //     peso: map['peso'] as double,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Pessoa.fromJson(String source) => Pessoa.fromMap(json.decode(source) as Map<String, dynamic>);
}
