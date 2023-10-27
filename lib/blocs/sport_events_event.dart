part of 'sport_events_bloc.dart';

abstract class SportEventsEvent extends Equatable {
  const SportEventsEvent();

  @override
  List<Object> get props => [];
}

class GetSportEventsList extends SportEventsEvent {
  final String date;

  const GetSportEventsList({
    required this.date,
  });
}
