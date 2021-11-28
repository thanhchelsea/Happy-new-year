import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:happy_new_year/services/database.dart';

import 'repositories/repositories.dart';

GetIt locator = GetIt.instance..allowReassignment = true;

void setupLocator() {
  locator.registerLazySingleton<DatabaseProvider>(
      () => DatabaseProvider.databaseProvider);
  locator.registerLazySingleton<LoiChucRepository>(() => LoiChucRepository());
  locator.registerLazySingleton<CamNangRepository>(
      () => CamNangRepository(locator<DatabaseProvider>()));

  locator.registerLazySingleton<SMSRepository>(
      () => SMSRepository(locator<DatabaseProvider>()));

  locator.registerLazySingleton<VanKhanRepository>(() => VanKhanRepository(locator()));
}

void setupLocatorWithContext(BuildContext context) {
  locator.allowReassignment = true;
}
