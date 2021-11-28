import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/services/sevices.dart';

class SMSRepository {
  const SMSRepository(this._databaseProvider);

  final DatabaseProvider _databaseProvider;

  Future<List<SMSTeenModel>> getSMS() async {
    return await _databaseProvider.getSMS();
  }
}