import 'package:karate_shubudo/model/programacao/padrao.model.dart';

import 'data_base_helper.dart';

class PadroesController {
  final dbHelper = DatabaseHelper.instance;

  Future<List<PadraoModel>> getAllPadroes() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAllRows('Padroes');
    return List.generate(maps.length, (i) {
      return PadraoModel.fromMap(maps[i]);
    });
  }
}
