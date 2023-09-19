class PadraoModel {
  int id;
  String programacaoCor;
  String nome;
  String tipo;
  String base;
  String? observacao;

  PadraoModel({required this.id, required this.programacaoCor, required this.nome, required this.tipo, required this.base, this.observacao});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'programacao_cor': programacaoCor,
      'nome': nome,
      'tipo': tipo,
      'base': base,
      'observacao': observacao,
    };
  }

  factory PadraoModel.fromMap(Map<String, dynamic> map) {
    return PadraoModel(
      id: map['id'],
      programacaoCor: map['programacao_cor'],
      nome: map['nome'],
      tipo: map['tipo'],
      base: map['base'],
      observacao: map['observacao'],
    );
  }
}
