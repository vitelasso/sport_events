import 'package:sports_master_detail/models/sport_event.dart';
import 'package:sports_master_detail/resources/mock_data.dart';

// coverage:ignore-file
class ApiProvider {
  ApiProvider();

  //Usually this is an async method, but since there is no actually api call, we call call this synchronously
  List<SportEvent> fetchSportEvents({String date = 'today'}) {
    return List<SportEvent>.from(sportEvents
        .map((model) => SportEvent.fromJson(model))
        .where((element) => element.dateStarting.toLowerCase() == date));
  }
}
