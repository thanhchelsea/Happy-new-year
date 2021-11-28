import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/repositories/repositories.dart';

class CamNangBloc extends Bloc<CamNangEvent, CamNangState> {
  final CamNangRepository repository;
  CamNangBloc(this.repository) : super(CamNangLoadInProgress());

  @override
  Stream<CamNangState> mapEventToState(CamNangEvent event) async* {
    final currentState = state;
    if (event is CamNangFetched) {
      try {
        yield CamNangLoadInProgress();
        //final list = await repository.getLoiCHucs();
        final list = await repository.getCamNang(event.groupId);
        yield CamNangLoadSuccess(list: list);

      } catch(_) {
        print('Failure');
        yield CamNangLoadFailure();
      }
    }

    if (event is CamNangChanged) {
      yield CamNangLoadInProgress();
      List<CamNangModel> list = currentState.list;
      CamNangModel loiChuc = list[event.index];
      list[event.index] = new CamNangModel(id: loiChuc.id, group: loiChuc.group, content: event.changeText);
      //print(list[event.index].content);
      yield CamNangLoadSuccess(list: list);
    }
  }
}

abstract class CamNangEvent extends Equatable {
  const CamNangEvent();
}

class CamNangFetched extends CamNangEvent {
  final int groupId;
  const CamNangFetched({@required this.groupId});

  List<Object> get props => [groupId];
}

class CamNangChanged extends CamNangEvent {
  final String changeText;
  final int index;
  const CamNangChanged({@required this.changeText, @required this.index});

  List<Object> get props => [changeText, index];
}

abstract class CamNangState extends Equatable {
  const CamNangState({@required this.list});
  final List<CamNangModel> list;

  List<Object> get props => [list];
}

class CamNangLoadInProgress extends CamNangState {}

class CamNangLoadSuccess extends CamNangState {
  final List<CamNangModel> list;

  const CamNangLoadSuccess({@required this.list}): super(list: list);

  List<Object> get props => [list];
}

class CamNangLoadFailure extends CamNangState{}




