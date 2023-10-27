part of 'sport_events_bloc.dart';

abstract class SportEventsState extends Equatable {
  const SportEventsState();

  @override
  List<Object?> get props => [];
}

class SportEventsInitial extends SportEventsState {}

class SportEventsLoading extends SportEventsState {}

class SportEventsLoaded extends SportEventsState {
  final List<SportEvent> events;
  const SportEventsLoaded(this.events);
}

class SportEventsError extends SportEventsState {
  final String? message;
  const SportEventsError(this.message);
}
