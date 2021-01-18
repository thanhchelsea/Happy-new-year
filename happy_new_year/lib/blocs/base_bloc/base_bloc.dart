import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs.dart';
abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc(BaseState initialState) : super(initialState);
  // @override
  // BaseState get initialState => InitState();
}
