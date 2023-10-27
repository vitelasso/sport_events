import 'package:flutter_test/flutter_test.dart';
import 'package:sports_master_detail/models/sport_event.dart';

void main() {
  final event = SportEvent(
      iconUrl: 'test.png',
      league: 'a',
      teams: 'milan',
      sportType: 'football',
      dateStarting: 'today',
      timeStarting: '14:00');
  final eventFromJson = SportEvent.fromJson({
    'iconUrl': 'test.png',
    'league': 'a',
    'teams': 'milan',
    'sportType': 'football',
    'dateStarting': 'today',
    'timeStarting': '14:00'
  });

  final eventFromMap = SportEvent.fromMap({
    'iconUrl': 'test.png',
    'league': 'a',
    'teams': 'milan',
    'sportType': 'football',
    'dateStarting': 'today',
    'timeStarting': '14:00'
  });
  test('SportEvent model has correct values', () {
    expect(event.iconUrl, 'test.png');
  });

  test('SportEvent model returns to json correctly', () {
    expect(eventFromJson.toJson(), {
      'iconUrl': 'test.png',
      'league': 'a',
      'teams': 'milan',
      'sportType': 'football',
      'dateStarting': 'today',
      'timeStarting': '14:00'
    });
  });

  test('SportEvent model returns to json correctly', () {
    expect(eventFromMap.toMap(), {
      'iconUrl': 'test.png',
      'league': 'a',
      'teams': 'milan',
      'sportType': 'football',
      'dateStarting': 'today',
      'timeStarting': '14:00'
    });
  });
}
