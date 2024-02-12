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

abstract class BaseDataBloc<T, P extends BaseDataParams>
    extends Bloc<BaseDataEvent, BaseDataState<T>> {
  BaseDataBloc({
    required this.hasConnection,
  }) : super(BaseDataState<T>()) {
    on<CallAction<P>>(_onCallAction);
  }

  final HasConnection hasConnection;

  FutureOr<void> _onCallAction(
    CallAction<P> event,
    Emitter<BaseDataState<T>> emit,
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
      log('${runtimeType.toString().split('.').last}: Error: ${l.message}');
      onFailure(emit, l);
    }, (r) {
      log('${runtimeType.toString().split('.').last}: Success: ${r.toString()}');
      onSuccess(emit, r, event.params);
    });
  }

  FutureOr<void> restoreData(
    RestoreData event,
    Emitter<BaseDataState<T>> emit,
  ) async {
    // ignore: prefer_const_constructors
    emit(BaseDataState());
  }

  void onFailure(Emitter<BaseDataState<T>> emit, Failure failure) {
    emit(
      state.copyWith(
        message: failure.message,
        status: ScreenStatusType.error,
        errorCode: failure.code,
      ),
    );
  }

  void onSuccess(
    Emitter<BaseDataState<T>> emit,
    T value,
    BaseDataParams? params,
  ) {
    emit(state.copyWith(status: ScreenStatusType.loaded, value: value));
  }

  Future<Either<Failure, T>> repositoryCall(
    P? params,
  );

  void callAction(P? params) {
    add(CallAction<P>(params: params));
  }
}
