part of 'base_data_bloc.dart';

abstract class BaseScreenEvent extends Equatable {
  const BaseScreenEvent();
}

class CallAction extends BaseScreenEvent {
  const CallAction({
    this.params = const ScreenParams(),
  });
  final ScreenParams params;

  @override
  List<Object?> get props => [params];
}

class RestoreData extends BaseScreenEvent {
  const RestoreData();
  @override
  List<Object?> get props => [];
}
