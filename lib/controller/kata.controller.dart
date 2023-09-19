import 'package:karate_shubudo/model/programacao/kata.model.dart';

import 'data_base_helper.dart';

class KataController {
  final dbHelper = DatabaseHelper.instance;

  Future<List<KataModel>> getAllKata() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAllRows('Katas');
    return List.generate(maps.length, (i) {
      return KataModel.fromMap(maps[i]);
    });
  }
}
