import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/services/database.dart';

class VanKhanRepository {
  const VanKhanRepository(this._databaseProvider);

  final DatabaseProvider _databaseProvider;

  Future<List<VanKhanModel>> getVanKhan(int groupId) async {
    return await _databaseProvider.getVanKhan(groupId);
  }
}