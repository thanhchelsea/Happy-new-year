import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(),
          ),
          BlocProvider<LiXiBloc>(
            create: (_) => LiXiBloc(),
          ),
          BlocProvider<TaoThiepBloc>(
            create: (_) => TaoThiepBloc(),
          ),
        ],
        child: MyApp.language(),
      ),
    ),
  );
}
