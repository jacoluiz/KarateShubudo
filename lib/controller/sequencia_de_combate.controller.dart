import 'package:karate_shubudo/model/programacao/sequencia_de_combate.model.dart';

import 'data_base_helper.dart';

class SequenciaDeCombateController {
  final dbHelper = DatabaseHelper.instance;

  Future<List<SequenciaDeCombateModel>> getAllSequencias() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAllRows('SequenciasDeCombate');
    return List.generate(maps.length, (i) {
      return SequenciaDeCombateModel.fromMap(maps[i]);
    });
  }
}
