import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LiXiEvent {
  final dynamic payload;
  LiXiEvent(this.payload);
}

class ChonLiXi extends LiXiEvent {
  ChonLiXi(bool payload) : super(payload);
}

class ResetLiXi extends LiXiEvent {
  ResetLiXi(bool payload) : super(payload);
}

class ConfirmListLiXi extends LiXiEvent {
  ConfirmListLiXi(List<String> payload) : super(payload);
}
class ErrorLength extends LiXiEvent {
  ErrorLength(bool payload) : super(payload);
}

@immutable
abstract class LiXiState {
  final List<String> tien;
  final bool isdialog;
  final bool hideAllItem;
  LiXiState({this.isdialog, this.tien, this.hideAllItem});
}

class InitialLiXiState extends LiXiState {
  InitialLiXiState({isdialog, tien, hideAllItem})
      : super(
          isdialog: false,
          tien: [],
          hideAllItem: true,
        );
}

class ChonLiXiState extends LiXiState {
  ChonLiXiState.fromOldLiXiState(
    LiXiState oldState, {
    bool isdialog,
    List<int> tien,
    bool hideAllItem,
  }) : super(
          isdialog: isdialog ?? oldState.isdialog,
          tien: tien ?? oldState.tien,
          hideAllItem: hideAllItem ?? oldState.hideAllItem,
        );
}

class ResetLiXiState extends LiXiState {
  ResetLiXiState.fromOldLiXiState(
    LiXiState oldState, {
    bool isdialog,
    List<String> tien,
    bool hideAllItem,
  }) : super(
          isdialog: false,
          tien: tien ?? oldState.tien,
          hideAllItem: false,
        );
}
class Error extends LiXiState{
  Error.fromOldLiXiState(
      LiXiState oldState, {
        bool isdialog,
        List<String> tien,
        bool hideAllItem,
      }) : super(
    isdialog: false,
    tien: tien ?? oldState.tien,
    hideAllItem: false,
  );
}
class AddMoneyState extends LiXiState {
  AddMoneyState.fromOldLiXiState(
      LiXiState oldState, {
        bool isdialog,
        List<String> tien,
        bool hideAllItem,
      }) : super(
    isdialog: false,
    tien: tien ?? oldState.tien,
    hideAllItem: false,
  );
}
class LiXiBloc extends Bloc<LiXiEvent, LiXiState> {
  @override
  LiXiState get initialState => InitialLiXiState();
  @override
  Stream<LiXiState> mapEventToState(LiXiEvent event) async* {
    if (event is ChonLiXi) {
      yield ChonLiXiState.fromOldLiXiState(
        state,
        isdialog: event.payload,
      );
    }
    if (event is ResetLiXi) {
      List<String> a =state.tien;
      List<String> b = getRandomElement(a);
      yield ResetLiXiState.fromOldLiXiState(state,tien: b);
    }
    if (event is ConfirmListLiXi) {
      List<String> a = event.payload;
      List<String> b = getRandomElement(a);
      yield AddMoneyState.fromOldLiXiState(
        state,
        isdialog: false,
        tien: b,
        hideAllItem: true,
      );
    }
    if(event is ErrorLength){
      yield Error.fromOldLiXiState(state);
    }
  }

  List<String> getRandomElement<T>(List<String> list) {
    final random = new Random();
     List<String> a = List.generate(list.length, (_) => list[random.nextInt(list.length)]);
    return a;
  }
}
