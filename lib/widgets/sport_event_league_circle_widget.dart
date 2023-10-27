import 'package:flutter/material.dart';
import 'package:sports_master_detail/models/sport_event.dart';

class SportEventsLeagueCircleWidget extends StatelessWidget {
  final SportEvent event;

  const SportEventsLeagueCircleWidget({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE7F4F8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lega'.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            event.league.split(" ")[1],
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
