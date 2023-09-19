import 'dart:convert';

import 'package:karate_shubudo/model/programacao/padrao.model.dart';

class KataModel {
  int id;
  int forma;
  List<PadraoModel> sequencia;
  String? observacao;
  String programacaoCor;

  KataModel({required this.id, required this.forma, this.sequencia = const [], this.observacao, required this.programacaoCor});

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
      'forma': forma,
      'sequencia': serializeSequencia(),
      'observacao': observacao,
      'programacao_cor': programacaoCor,
    };
  }

  factory KataModel.fromMap(Map<String, dynamic> map) {
    return KataModel(
      id: map['id'],
      forma: map['forma'],
      sequencia: deserializeSequencia(map['sequencia']),
      observacao: map['observacao'],
      programacaoCor: map['programacao_cor'],
    );
  }
}
