import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sports_master_detail/blocs/sport_events_bloc.dart';
import 'package:sports_master_detail/models/sport_event.dart';
import 'package:sports_master_detail/resources/api_repository.dart';

import 'sport_events_bloc_test.mocks.dart';

class SportEventsMock extends MockBloc<SportEventsEvent, SportEventsState>
    implements SportEventsBloc {}

@GenerateMocks([ApiRepository])
void main() {
  late SportEventsBloc bloc;
  late MockApiRepository repository;

  setUp(() {
    repository = MockApiRepository();
    bloc = SportEventsBloc(repository: repository);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is correct', () {
    expect(bloc.initialState, SportEventsInitial());
  });

  group('SportEventsBloc test', () {
    final List<SportEvent> mockEvents = [
      SportEvent(
          iconUrl: 'test.png',
          league: 'a',
          teams: 'milan',
          sportType: 'football',
          dateStarting: 'today',
          timeStarting: '14:00'),
      SportEvent(
          iconUrl: 'test.png',
          league: 'a',
          teams: 'lazio',
          sportType: 'football',
          dateStarting: 'today',
          timeStarting: '14:00'),
      SportEvent(
          iconUrl: 'test.png',
          league: 'a',
          teams: 'rome',
          sportType: 'football',
          dateStarting: 'today',
          timeStarting: '14:00'),
    ];
    blocTest(
      'emits [SportEventsLoading, SportEventsLoaded] when GetSportEventsList is added and fetchSportEvents succeeds',
      build: () {
        when(repository.fetchSportEvents()).thenAnswer(
          (_) => mockEvents,
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const GetSportEventsList(date: 'today')),
      expect: () => [SportEventsLoading(), SportEventsLoaded(mockEvents)],
    );
    blocTest(
      'emits [SportEventsLoading, SportEventsError] when GetSportEventsList is added and fetchSportEvents fails',
      build: () {
        when(repository.fetchSportEvents())
            .thenThrow(Exception('error getting sport events'));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetSportEventsList(date: 'today')),
      expect: () => [
        SportEventsLoading(),
        const SportEventsError('error getting sport events')
      ],
    );
  });
}
