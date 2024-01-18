part of 'base_data_bloc.dart';

abstract class BaseScreenEvent extends Equatable {
  const BaseScreenEvent();
}

class CallAction<P extends ScreenParams> extends BaseScreenEvent {
  const CallAction({this.params});
  final ScreenParams? params;

  @override
  List<Object?> get props => [params];
}

class RestoreData extends BaseScreenEvent {
  const RestoreData();
  @override
  List<Object?> get props => [];
}
