import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/blocs/base_bloc/base.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/locator.dart';
import 'package:happy_new_year/repositories/repositories.dart';

class LoiChucBloc extends Bloc<LoiChucEvent, LoiChucState> {
  final LoiChucRepository repository;
  LoiChucBloc({@required this.repository}) : super(LoiChucIntital());

  @override
  Stream<LoiChucState> mapEventToState(LoiChucEvent event) async* {
    final currentState = state;
   if (event is LoiChucFetched) {
      try {
        yield LoiChucLoadInProgress();
        //final list = await repository.getLoiCHucs();
        final list = await repository.getLoiCHucs(event.topic);
        yield LoiChucLoadSuccess(list: list);

      } catch(_) {
        print('Failure');
        yield LoiChucLoadFailure();
      }
   }

   if (event is LoiChucChanged) {
      yield LoiChucLoadInProgress();
      List<LoiChuc> list = currentState.list;
      LoiChuc loiChuc = list[event.index];
      list[event.index] = new LoiChuc(id: loiChuc.id, role: loiChuc.role, content: event.changeText);
      //print(list[event.index].content);
      yield LoiChucLoadSuccess(list: list);
   }
  }


}

abstract class LoiChucEvent extends Equatable {
  const LoiChucEvent();
}

class LoiChucFetched extends LoiChucEvent {
  final String topic;
  const LoiChucFetched({@required this.topic});
  @override
  // TODO: implement props
  List<Object> get props => [topic];
}

class LoiChucChanged extends LoiChucEvent {
  final String changeText;
  final int index;
  const LoiChucChanged({@required this.changeText, @required this.index});

  @override
  // TODO: implement props
  List<Object> get props => [changeText, index];
}

abstract class LoiChucState extends Equatable {
  const LoiChucState({@required this.list});
  final List<LoiChuc> list;
  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class LoiChucIntital extends LoiChucState {}

class LoiChucLoadInProgress extends LoiChucState {}

class LoiChucLoadSuccess extends LoiChucState {
  final List<LoiChuc> list;

  const LoiChucLoadSuccess({@required this.list}): super(list: list);

  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class LoiChucLoadFailure extends LoiChucState{}




