import 'dart:convert';

import 'package:karate_shubudo/model/programacao/padrao.model.dart';

class SequenciaDeCombateModel {
  int id;
  String nome;
  int movimentos;
  List<PadraoModel> sequencia;
  String? observacao;
  String programacaoCor;

  SequenciaDeCombateModel({
    required this.id,
    required this.nome,
    required this.movimentos,
    this.sequencia = const [],
    this.observacao,
    required this.programacaoCor,
  });

  String serializeSequencia() {
    final List<Map<String, dynamic>> serializedList = sequencia.map((padrao) => padrao.toMap()).toList();
    return jsonEncode(serializedList);
  }

  static List<PadraoModel> deserializeSequencia(String sequenciaJson) {
    final List<dynamic> serializedList = jsonDecode(sequenciaJson);
    return serializedList.map((item) => PadraoModel.fromMap(item)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'movimentos': movimentos,
      'sequencia': serializeSequencia(),
      'observacao': observacao,
      'programacao_cor': programacaoCor,
    };
  }

  factory SequenciaDeCombateModel.fromMap(Map<String, dynamic> map) {
    return SequenciaDeCombateModel(
      id: map['id'],
      nome: map['nome'],
      movimentos: map['movimentos'],
      sequencia: deserializeSequencia(map['sequencia']),
      observacao: map['observacao'],
      programacaoCor: map['programacao_cor'],
    );
  }
}
