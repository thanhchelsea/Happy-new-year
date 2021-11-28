import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/repositories/repositories.dart';

class LoiChucBloc extends Bloc<LoiChucEvent, LoiChucState> {
  final LoiChucRepository repository;
  LoiChucBloc({@required this.repository}) : super(LoiChucLoadInProgress());

  @override
  Stream<LoiChucState> mapEventToState(LoiChucEvent event) async* {
    final currentState = state;
   if (event is LoiChucFetched) {
      try {
        yield LoiChucLoadInProgress();
        //final list = await repository.getLoiCHucs();
        final list = await repository.getLoiCHucs(event.groupId);
        yield LoiChucLoadSuccess(list: list);

      } catch(_) {
        print('Failure');
        yield LoiChucLoadFailure();
      }
   }

   if (event is LoiChucChanged) {
      yield LoiChucLoadInProgress();
      List<LoiChucModel> list = currentState.list;
      LoiChucModel loiChuc = list[event.index];
      list[event.index] = new LoiChucModel(id: loiChuc.id, group: loiChuc.group, content: event.changeText);
      //print(list[event.index].content);
      yield LoiChucLoadSuccess(list: list);
   }
  }


}

abstract class LoiChucEvent extends Equatable {
  const LoiChucEvent();
}

class LoiChucFetched extends LoiChucEvent {
  final int groupId;
  const LoiChucFetched({@required this.groupId});
  @override
  // TODO: implement props
  List<Object> get props => [groupId];
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
  final List<LoiChucModel> list;
  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class LoiChucInitial extends LoiChucState {}

class LoiChucLoadInProgress extends LoiChucState {}

class LoiChucLoadSuccess extends LoiChucState {
  final List<LoiChucModel> list;

  const LoiChucLoadSuccess({@required this.list}): super(list: list);

  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class LoiChucLoadFailure extends LoiChucState{}




