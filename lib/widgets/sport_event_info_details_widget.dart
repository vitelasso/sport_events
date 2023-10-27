import 'package:flutter/material.dart';
import 'package:sports_master_detail/models/sport_event.dart';

class SportEventsInfoDetailsWidget extends StatelessWidget {
  final SportEvent event;
  final CrossAxisAlignment alignment;

  const SportEventsInfoDetailsWidget({
    required this.event,
    this.alignment = CrossAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: alignment,
      children: [
        Text(
          '${event.dateStarting} | ${event.timeStarting}',
          style: const TextStyle(
            color: Color(0xFF000000),
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(event.teams,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
