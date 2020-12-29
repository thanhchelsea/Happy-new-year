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

@immutable
abstract class LiXiState {
  final List<int> tien;
  final bool isdialog;
  final bool hideAllItem;
  LiXiState({this.isdialog, this.tien, this.hideAllItem});
}

class InitialLiXiState extends LiXiState {
  InitialLiXiState()
      : super(
          isdialog: false,
          tien: [1, 2, 3, 4, 5, 6, 7, 8, 9],
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
        List<int> tien,
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
      List<int> a = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      List<int> b = getRandomElement(a);
      yield ResetLiXiState.fromOldLiXiState(state,tien: b);
    }
  }

  List<int> getRandomElement<T>(List<int> list) {
    final random = new Random();
    List<int> a = List.generate(10, (_) => list[random.nextInt(list.length)]);
    return a;
  }
}
