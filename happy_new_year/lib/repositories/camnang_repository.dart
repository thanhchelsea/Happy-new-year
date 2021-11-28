import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/services/database.dart';

class CamNangRepository {
  const CamNangRepository(this._databaseProvider);
  final DatabaseProvider _databaseProvider;


  Future<List<CamNangModel>> getCamNang(int groupId) async {
    return await _databaseProvider.getCamNang(groupId);
  }
}