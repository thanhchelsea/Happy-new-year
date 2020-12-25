import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs.dart';
abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  @override
  BaseState get initialState => InitState();
}
