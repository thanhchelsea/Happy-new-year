import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/blocs/loichuc_bloc.dart';
import 'package:happy_new_year/locator.dart';
import 'package:happy_new_year/repositories/repositories.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  LoiChucRepository repository = locator<LoiChucRepository>();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      MultiBlocProvider(
        providers: [
          // BlocProvider<HomeBloc>(
          //   create: (_) => HomeBloc(),
          // ),
          BlocProvider<LiXiBloc>(
            create: (_) => LiXiBloc(),
          ),
          BlocProvider<TaoThiepBloc>(
            create: (_) => TaoThiepBloc(),
          ),
          BlocProvider<LoiChucBloc>(
            create: (_) => LoiChucBloc(repository: repository),
          ),
        ],
        child: MyApp.language(),
      ),
    ),
  );
}
