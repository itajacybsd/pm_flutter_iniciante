class CriarPessoaDto {
  final String nome;
  final int altura;
  final double peso;

  const CriarPessoaDto({
    required this.nome,
    required this.altura,
    required this.peso,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nome': nome,
      'altura': altura,
      'peso': peso.toDouble(),
    };
  }
}
