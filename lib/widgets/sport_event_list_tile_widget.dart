import 'package:flutter/material.dart';
import 'package:sports_master_detail/models/sport_event.dart';
import 'package:sports_master_detail/pages/sport_events_detail_page.dart';
import 'package:sports_master_detail/widgets/sport_event_info_details_widget.dart';
import 'package:sports_master_detail/widgets/sport_event_league_circle_widget.dart';

class SportEventsListTileWidget extends StatelessWidget {
  final SportEvent event;

  const SportEventsListTileWidget({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: SportEventsInfoDetailsWidget(event: event),
        leading: FadeInImage(
          image: NetworkImage(event.iconUrl),
          placeholder: const AssetImage('assets/images/tvg_logo.png'),
          imageErrorBuilder: (context, error, stackTrace) =>
              Image.asset('assets/images/tvg_logo.png', fit: BoxFit.fitHeight),
          fit: BoxFit.cover,
        ),
        trailing: SportEventsLeagueCircleWidget(event: event),
        onTap: () {
          // Navigate to the details page. If the user leaves and returns to
          // the app after it has been killed while running in the
          // background, the navigation stack is restored.
          Navigator.restorablePushNamed(
            context,
            SportEventDetailsPage.routeName,
            arguments: event.toMap(),
          );
        });
  }
}
