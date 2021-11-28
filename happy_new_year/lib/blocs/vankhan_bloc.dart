import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/repositories/repositories.dart';

class VanKhanBloc extends Bloc<VanKhanEvent, VanKhanState> {
  VanKhanBloc(this._vanKhanRepository) : super(VanKhanLoadInProgress());

  final VanKhanRepository _vanKhanRepository;

  @override
  Stream<VanKhanState> mapEventToState(VanKhanEvent event) async* {
    if (event is VanKhanFetched) {
      try {
        final list = await _vanKhanRepository.getVanKhan(event.groupId);
        yield VanKhanLoadSuccess(listOfVanKhan: list);
      } catch (e) {
        print('Failure');
        yield VanKhanLoadFailure();
      }
    }
  }
}

abstract class VanKhanEvent extends Equatable {
  const VanKhanEvent();
}

class VanKhanFetched extends VanKhanEvent {
  final int groupId;

  const VanKhanFetched({@required this.groupId});

  List<Object> get props => [groupId];
}

abstract class VanKhanState extends Equatable {
  const VanKhanState({this.listOfVanKhan});

  final List<VanKhanModel> listOfVanKhan;

  List<Object> get props => [listOfVanKhan];
}

class VanKhanLoadInProgress extends VanKhanState {}

class VanKhanLoadSuccess extends VanKhanState {
  const VanKhanLoadSuccess({List<VanKhanModel> listOfVanKhan})
      : super(listOfVanKhan: listOfVanKhan);
}

class VanKhanLoadFailure extends VanKhanState {}
