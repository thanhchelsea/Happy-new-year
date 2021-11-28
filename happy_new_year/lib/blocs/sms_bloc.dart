import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_new_year/data/model/model.dart';
import 'package:happy_new_year/repositories/repositories.dart';

class SMSBloc extends Bloc<SMSEvent, SMSState> {
  SMSBloc(this._smsRepository) : super(SMSLoadInProgress());

  final SMSRepository _smsRepository;
  @override
  Stream<SMSState> mapEventToState(SMSEvent event) async* {
    if(event is GetSMS) {
      try {
        final list = await _smsRepository.getSMS();
        yield SMSLoadSuccess(listOfSMS: list);
      } catch (e){
        print('Failure');
        yield SMSLoadFailure();
      }
    }
  }
}

abstract class SMSEvent extends Equatable {
  const SMSEvent();

  List<Object> get props => [];
}

class GetSMS extends SMSEvent {
  const GetSMS();
}

abstract class SMSState extends Equatable {
  const SMSState({this.listOfSMS});

  final List<SMSTeenModel> listOfSMS;

  List<Object> get props => [listOfSMS];
}

class SMSLoadInProgress extends SMSState {}

class SMSLoadSuccess extends SMSState {
  const SMSLoadSuccess({List<SMSTeenModel> listOfSMS}) : super(listOfSMS: listOfSMS);
}

class SMSLoadFailure extends SMSState {}
