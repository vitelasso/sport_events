import 'package:flutter/material.dart';
import 'package:sports_master_detail/models/sport_event.dart';
import 'package:sports_master_detail/resources/mock_data.dart';
import 'package:sports_master_detail/widgets/sport_event_info_details_widget.dart';
import 'package:sports_master_detail/widgets/sport_event_league_circle_widget.dart';
import 'package:flutter_html/flutter_html.dart';

/// Displays detailed information about a SportEvent.
class SportEventDetailsPage extends StatelessWidget {
  final Map<String, dynamic> event;

  const SportEventDetailsPage({
    required this.event,
    super.key,
  });

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    SportEvent selectedEvent = SportEvent.fromMap(event);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171E31),
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/images/tvg_logo.png', fit: BoxFit.fitHeight),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SportEventsLeagueCircleWidget(event: selectedEvent),
              const SizedBox(height: 24),
              SportEventsInfoDetailsWidget(
                  event: selectedEvent, alignment: CrossAxisAlignment.center),
              const SizedBox(height: 24),
              const Divider(
                height: 8,
                thickness: 0.1,
                indent: 32.0,
                endIndent: 32.0,
                color: Colors.black,
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: 46,
                height: 46,
                child: FadeInImage(
                  image: NetworkImage(selectedEvent.iconUrl),
                  placeholder: const AssetImage('assets/images/tvg_logo.png'),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/tvg_logo.png',
                          fit: BoxFit.fitHeight),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Html(
                  data: mockHtmlDetailText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
