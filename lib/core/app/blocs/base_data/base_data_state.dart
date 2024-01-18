part of 'base_data_bloc.dart';

enum ScreenStatusType {
  initial,
  loading,
  loaded,
  error,
  noInternet,
  localLoading,
  updated,
}

extension ScreenStatusTypeX on ScreenStatusType {
  bool get isInitial => this == ScreenStatusType.initial;
  bool get isLoading => this == ScreenStatusType.loading;
  bool get isLoaded => this == ScreenStatusType.loaded;
  bool get isError => this == ScreenStatusType.error;
  bool get isNoInternet => this == ScreenStatusType.noInternet;
  bool get isLocalLoading => this == ScreenStatusType.localLoading;
  bool get isUpdated => this == ScreenStatusType.updated;
}

class BaseDataState<T> extends Equatable {
  const BaseDataState({
    ScreenStatusType? status,
    this.value,
    String? message,
    this.errorCode,
  })  : status = status ?? ScreenStatusType.initial,
        message = message ?? '';

  final ScreenStatusType status;
  final T? value;
  final String message;
  final int? errorCode;

  BaseDataState<T> copyWith({
    ScreenStatusType? status,
    T? value,
    String? message,
    int? errorCode,
  }) =>
      BaseDataState(
        status: status ?? this.status,
        value: value ?? this.value,
        message: message ?? this.message,
        errorCode: errorCode ?? this.errorCode,
      );
  @override
  List<Object?> get props => [status, value, message, errorCode];
}
