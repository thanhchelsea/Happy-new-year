import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/locator.dart';
import 'package:happy_new_year/services/database.dart';

class LoiChucRepository {
  DatabaseProvider databaseProvider = locator<DatabaseProvider>();

  Future<List<LoiChuc>> getLoiCHucs(String topic) async {
    return await databaseProvider.getLoiChucs(topic);
  }
}