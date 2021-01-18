import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:happy_new_year/services/database.dart';

import 'repositories/repositories.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DatabaseProvider.databaseProvider);
  locator.registerLazySingleton<LoiChucRepository>(() => LoiChucRepository());

}

void setupLocatorWithContext(BuildContext context) {
  locator.allowReassignment = true;
}