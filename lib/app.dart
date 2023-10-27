import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sports_master_detail/pages/sport_events_detail_page.dart';
import 'package:sports_master_detail/pages/sport_events_tab_bar_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.

    return MaterialApp(
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      theme: ThemeData(
        brightness: Brightness.light,
        tabBarTheme: const TabBarTheme(
            labelColor: Color(0xFF26AEFB),
            labelStyle: TextStyle(
                color: Color(0xFF26AEFB),
                fontWeight: FontWeight.w400), // color for text
            indicator: UnderlineTabIndicator(
                // color for indicator (underline)
                borderSide: BorderSide(
                  color: Color(0xFF26AEFB),
                  width: 3,
                ),
                insets: EdgeInsets.symmetric(horizontal: 32.0))),
        primaryColor: Color(
            0xFFF3F3F3), // outdated and has no effect to Tabbar// deprecated,
      ),

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SportEventDetailsPage.routeName:
                final args = routeSettings.arguments as Map<String, dynamic>;
                return SportEventDetailsPage(
                  event: args,
                );
              case SportEventsTabBarPage.routeName:
              default:
                return const SportEventsTabBarPage();
            }
          },
        );
      },
    );
  }
}
