import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_structure_flutter/core/app/blocs/base_data/params/base_data_params.dart';
import 'package:generic_structure_flutter/core/app/services/internet_service.dart';
import 'package:generic_structure_flutter/domain/failures/failure.dart';

part 'base_data_event.dart';
part 'base_data_state.dart';

abstract class BaseScreenBloc<T>
    extends Bloc<BaseScreenEvent, BaseScreenState<T>> {
  BaseScreenBloc({
    required this.hasConnection,
  }) : super(BaseScreenState<T>()) {
    on<CallAction>(onCallAction);
    on<RestoreData>(_restoreData);
  }

  final HasConnection hasConnection;

  FutureOr<void> onCallAction(
    CallAction event,
    Emitter<BaseScreenState<T>> emit,
  ) async {
    emit(state.copyWith(status: ScreenStatusType.loading));
    late bool hasInternet;
    hasInternet = await hasConnection.call();
    if (!hasInternet) {
      emit(state.copyWith(status: ScreenStatusType.noInternet));
      return;
    }
    final res = await repositoryCall(event.params);
    res.fold((l) {
      log('Error: ${l.message}');
      onFailure(emit, l);
    }, (r) {
      log('Success: ${r.toString()}');
      onSuccess(emit, r, event.params);
    });
  }

  FutureOr<void> _restoreData(
    RestoreData event,
    Emitter<BaseScreenState<T>> emit,
  ) async {
    // ignore: prefer_const_constructors
    emit(BaseScreenState());
  }

  void onFailure(Emitter<BaseScreenState<T>> emit, Failure failure) {
    emit(
      state.copyWith(
        message: failure.message,
        status: ScreenStatusType.error,
        errorCode: failure.code,
      ),
    );
  }

  void onSuccess(
    Emitter<BaseScreenState<T>> emit,
    T value,
    ScreenParams params,
  ) {
    emit(state.copyWith(status: ScreenStatusType.loaded, value: value));
  }

  Future<Either<Failure, T>> repositoryCall(
    ScreenParams params,
  );
}
