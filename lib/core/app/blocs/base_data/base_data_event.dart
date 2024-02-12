part of 'base_data_bloc.dart';

abstract class BaseDataEvent extends Equatable {
  const BaseDataEvent();
}

class CallAction<P extends BaseDataParams> extends BaseDataEvent {
  const CallAction({this.params})
      : assert(
          (P is! BaseDataParams && params is BaseDataParams) ||
              (P is BaseDataParams && params is! BaseDataParams),
          'Error: This call action requires a parameter of type $P but was provided a parameter of type $params',
        );
  final P? params;

  @override
  List<Object?> get props => [params];
}

class RestoreData extends BaseDataEvent {
  const RestoreData();
  @override
  List<Object?> get props => [];
}
