import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sports_master_detail/models/sport_event.dart';
import 'package:sports_master_detail/resources/api_repository.dart';

part 'sport_events_event.dart';
part 'sport_events_state.dart';

class SportEventsBloc extends Bloc<SportEventsEvent, SportEventsState> {
  ApiRepository? repository;
  SportEventsBloc({this.repository}) : super(SportEventsInitial()) {
    repository ??= ApiRepository();
    on<GetSportEventsList>((event, emit) {
      //add delay on purpose for seeing a progress indicator, like mocking the api response
      try {
        emit(SportEventsLoading());
        final mList = repository?.fetchSportEvents(
          date: event.date,
        );
        emit(SportEventsLoaded(mList ?? []));
      } on Exception {
        emit(const SportEventsError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }

  get initialState => SportEventsInitial();
}
