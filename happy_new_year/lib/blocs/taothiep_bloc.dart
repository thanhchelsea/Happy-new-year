import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:happy_new_year/blocs/blocs.dart';
import 'package:happy_new_year/res/colors.dart';
import 'package:happy_new_year/res/resources.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TaoThiepEvent {
  final dynamic payload;
  TaoThiepEvent(this.payload);
}

class ChoseImage extends TaoThiepEvent {
  ChoseImage(String payload) : super(payload);
}

class ChangColor extends TaoThiepEvent {
  ChangColor(Color payload) : super(payload);
}

class ChangeSize extends TaoThiepEvent {
  ChangeSize(int payload) : super(payload);
}

class ChangeFont extends TaoThiepEvent {
  ChangeFont(String payload) : super(payload);
}

class ChangeText extends TaoThiepEvent {
  ChangeText(String payload) : super(payload);
}

@immutable
abstract class TaoThiepState {
  int size;
  String font;
  Color color;
  String image;
  String loiChuc;

  TaoThiepState({this.size, this.font, this.color, this.image, this.loiChuc});
}

class InitThiep extends TaoThiepState {
  InitThiep({
    int size,
    String font,
    Color color,
    String image,
    String loiChuc,
  }) : super(
          size: 14,
          font: "0",
          color: AppTheme.nearlyDarkBrown,
          image: AppImages.THIEP6,
          loiChuc: "Happy new Year",
        );
}

class ChosseThiepState extends TaoThiepState {
  ChosseThiepState.fromOldState(
    TaoThiepState oldState, {
    int size,
    String font,
    Color color,
    String image,
    String loiChuc,
  }) : super(
          size: size ?? oldState.size,
          font: font ?? oldState.font,
          color: color ?? oldState.color,
          image: image ?? oldState.image,
          loiChuc: loiChuc ?? oldState.loiChuc,
        );
}

class Laoding extends TaoThiepState {
  Laoding.fromOldState(
    TaoThiepState oldState, {
    int size,
    String font,
    Color color,
    String image,
    String loiChuc,
  }) : super(
          size: size ?? oldState.size,
          font: font ?? oldState.font,
          color: color ?? oldState.color,
          image: image ?? oldState.image,
          loiChuc: loiChuc ?? oldState.loiChuc,
        );
}

class ChangeColorState extends TaoThiepState {
  ChangeColorState.fromOldState(
    TaoThiepState oldState, {
    int size,
    String font,
    Color color,
    String image,
    String loiChuc,
  }) : super(
          size: size ?? oldState.size,
          font: font ?? oldState.font,
          color: color ?? oldState.color,
          image: image ?? oldState.image,
          loiChuc: loiChuc ?? oldState.loiChuc,
        );
}

class TaoThiepBloc extends Bloc<TaoThiepEvent, TaoThiepState> {
  TaoThiepBloc({TaoThiepState initialState}) : super(InitThiep());
// thay doi ababbaba

  @override
  Stream<TaoThiepState> mapEventToState(TaoThiepEvent event) async* {
    if (event is ChoseImage) {
      yield ChosseThiepState.fromOldState(state, image: event.payload);
    }
    if (event is ChangColor) {
      yield ChangeColorState.fromOldState(state, color: event.payload);
    }
    if (event is ChangeSize) {
      yield ChangeColorState.fromOldState(state, size: event.payload);
    }
    if (event is ChangeFont) {
      yield ChangeColorState.fromOldState(state, font: event.payload);
    }
    if (event is ChangeText) {
      yield ChangeColorState.fromOldState(state, loiChuc: event.payload);
    }
  }
}
