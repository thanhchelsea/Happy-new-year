import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/locator.dart';
import 'package:happy_new_year/services/database.dart';

class LoiChucRepository {
  DatabaseProvider databaseProvider = locator<DatabaseProvider>();

  Future<List<LoiChucModel>> getLoiCHucs(int groupId) async {
    return await databaseProvider.getLoiChucs(groupId);
  }
}