import '../model/faixa.model.dart';
import 'data_base_helper.dart';

class FaixaController {
  final dbHelper = DatabaseHelper.instance;

  Future<List<FaixaModel>> getAllFaixas() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAllRows('Faixas');
    return List.generate(maps.length, (i) {
      return FaixaModel.fromMap(maps[i]);
    });
  }
}
