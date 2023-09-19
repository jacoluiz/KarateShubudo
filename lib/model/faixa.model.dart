import 'package:karate_shubudo/model/programacao/kata.model.dart';
import 'package:karate_shubudo/model/programacao/padrao.model.dart';
import 'package:karate_shubudo/model/programacao/sequencia_de_combate.model.dart';

class FaixaModel {
  int id;
  String cor;
  List<PadraoModel> ataquesDeMao;
  List<PadraoModel>? chutes;
  List<PadraoModel>? defesas;
  List<PadraoModel>? defesasPessoais;
  List<SequenciaDeCombateModel>? sequenciaDeCombate;
  List<KataModel> kata;

  FaixaModel({
    required this.id,
    required this.cor,
    required this.ataquesDeMao,
    this.chutes,
    this.defesas,
    this.defesasPessoais,
    this.sequenciaDeCombate,
    required this.kata,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {
      'id': id,
      'cor': cor,
      'ataquesDeMao': ataquesDeMao.map((padrao) => padrao.toMap()).toList(),
      'kata': kata.map((kata) => kata.toMap()).toList(),
    };

    if (chutes != null) {
      data['chutes'] = chutes!.map((padrao) => padrao.toMap()).toList();
    }

    if (defesas != null) {
      data['defesas'] = defesas!.map((padrao) => padrao.toMap()).toList();
    }

    if (defesasPessoais != null) {
      data['defesasPessoais'] = defesasPessoais!.map((padrao) => padrao.toMap()).toList();
    }

    if (sequenciaDeCombate != null) {
      data['sequenciaDeCombate'] = sequenciaDeCombate!.map((sequencia) => sequencia.toMap()).toList();
    }

    return data;
  }

  factory FaixaModel.fromMap(Map<String, dynamic> map) {
    return FaixaModel(
      id: map['id'],
      cor: map['cor'],
      ataquesDeMao: (map['ataquesDeMao'] as List).map((item) => PadraoModel.fromMap(item)).toList(),
      kata: (map['kata'] as List).map((item) => KataModel.fromMap(item)).toList(),
      chutes: map.containsKey('chutes') ? (map['chutes'] as List).map((item) => PadraoModel.fromMap(item)).toList() : null,
      defesas: map.containsKey('defesas') ? (map['defesas'] as List).map((item) => PadraoModel.fromMap(item)).toList() : null,
      defesasPessoais: map.containsKey('defesasPessoais') ? (map['defesasPessoais'] as List).map((item) => PadraoModel.fromMap(item)).toList() : null,
      sequenciaDeCombate: map.containsKey('sequenciaDeCombate') ? (map['sequenciaDeCombate'] as List).map((item) => SequenciaDeCombateModel.fromMap(item)).toList() : null,
    );
  }
}
