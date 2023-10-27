import 'package:json_annotation/json_annotation.dart';

part 'sport_event.g.dart';

@JsonSerializable()
class SportEvent {
  String iconUrl;
  String league;
  String teams;
  String sportType;
  String dateStarting;
  String timeStarting;

  SportEvent({
    required this.iconUrl,
    required this.league,
    required this.teams,
    required this.sportType,
    required this.dateStarting,
    required this.timeStarting,
  });

  //this is needed to pass this object as argument in the Route,
  //in order for StandardMessageCodec can serialize it
  Map<String, dynamic> toMap() {
    return {
      'iconUrl': iconUrl,
      'league': league,
      'teams': teams,
      'sportType': sportType,
      'dateStarting': dateStarting,
      'timeStarting': timeStarting,
    };
  }

  factory SportEvent.fromMap(Map<String, dynamic> query) {
    return SportEvent(
      iconUrl: query["iconUrl"],
      league: query["league"],
      teams: query["teams"],
      sportType: query["sportType"],
      dateStarting: query["dateStarting"],
      timeStarting: query["timeStarting"],
    );
  }

  factory SportEvent.fromJson(Map<String, dynamic> json) =>
      _$SportEventFromJson(json);

  Map<String, dynamic> toJson() => _$SportEventToJson(this);
}
