import 'package:flutter/material.dart';
import 'package:sports_master_detail/models/sport_event.dart';
import 'package:sports_master_detail/widgets/sport_event_list_tile_widget.dart';

class SportEventsListWidget extends StatelessWidget {
  final String date;
  final List<SportEvent> events;

  const SportEventsListWidget({
    required this.date,
    required this.events,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // Providing a restorationId allows the ListView to restore the
      // scroll position when a user leaves and returns to the app after it
      // has been killed while running in the background.
      restorationId: date,
      itemCount: events.length,
      separatorBuilder: (context, index) => const Divider(
        height: 8,
        thickness: 0.1,
        indent: 32.0,
        endIndent: 32.0,
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = events[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: SportEventsListTileWidget(event: item),
        );
      },
    );
  }
}
