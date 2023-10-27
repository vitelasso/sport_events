import 'package:sports_master_detail/models/sport_event.dart';

import 'api_provider.dart';

// coverage:ignore-file
class ApiRepository {
  final _provider = ApiProvider();

  List<SportEvent> fetchSportEvents({String date = 'today'}) {
    return _provider.fetchSportEvents(date: date);
  }
}

class NetworkError extends Error {}
