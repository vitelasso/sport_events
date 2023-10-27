import 'package:flutter/material.dart';
import 'package:sports_master_detail/widgets/sport_events_tab_bar_view_widget.dart';

/// Displays a list of SportEvents by date and time.
class SportEventsTabBarPage extends StatelessWidget {
  const SportEventsTabBarPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF171E31),
          centerTitle: true,
          elevation: 0,
          title:
              Image.asset('assets/images/tvg_logo.png', fit: BoxFit.fitHeight),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(25),
            child: ColoredBox(
              color: Color(0xFFF3F3F3),
              child: TabBar(
                indicatorColor: Color(0xFF26AEFB),
                tabs: [
                  Tab(
                    height: 24,
                    iconMargin: EdgeInsets.only(bottom: 0.0),
                    text: ("Yesterday"),
                  ),
                  Tab(
                    height: 24,
                    iconMargin: EdgeInsets.only(bottom: 0.0),
                    text: ("Today"),
                  ),
                  Tab(
                    height: 24,
                    iconMargin: EdgeInsets.only(bottom: 0.0),
                    text: ("Tomorrow"),
                  )
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            SportEventsTabBarViewWidget(date: 'yesterday'),
            SportEventsTabBarViewWidget(date: 'today'),
            SportEventsTabBarViewWidget(date: 'tomorrow'),
          ],
        ),
      ),
    );
  }
}
