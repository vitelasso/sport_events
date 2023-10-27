# sports_master_detail

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)


## Architecture

### BLoC (/blocs)
The repo follows the BLoC (Business Logic Components) architectural pattern based on separated components, this
pattern allow a good separation of concepts, and the ability to easily modify and scale the solution without problems.

In the subject of this solution in particular we use two BLoCs (the logic could be developed to only use one single BLoC, but for clear separation of concepts i choosed to use two):
1. **SportEventBloc**

**SportEventBloc** BLoC is responsible for managing the fetching logic of the sport events list and handling several events:

- **GetSportEventsList** Event: Responsible to start the fetching call => emits the following events:
    1. **SportEventsLoading** state is the external call is loading
    2. **SportEventsLoaded** state is the external call has finished
    3. **SportEventsError** state is there was some error in the external call process

### Models (/models)
**SportEvent**: Model class that handles several properties like:

- iconUrl: property with the image url information
- league: property with the league name
- teams: property with the event facing teams 
- sportType: property with the event type
- dateStarting: property with the event date (this could be easily be extracted to an enum )
- timeStarting: property with the event time

### Pages (/pages)
The repo contains in total 3 widget pages that listen and consume BLoC states and render the proper UI

- **SportEventsTabBarPage**: First Page to be rendered by App and responsible to render Tab Bar Views with list of sport events page selected by date
- **SportEventDetailsPage**: Page responsible to render a Page regarding the specific sport event selected

### Widgets (/widgets)
General widgets folder where we should place all extracted widgets that could be reused across the app

## Testing
The testing part was taking into account for this app aswell, excluding the widgets (since 90% where dummy Stateless Widgets), and i was able to accomplish a total of **96.3.7%** code coverage (check by running **$ open coverage/html/index.html**), which seems to me reasonable and a stable metric to push the code.

The BLoC was tested using the **bloc_test** library and several dependencies were mocked in other to proceed with the tests.

## Improvements
Since an app is never perfect some improvements i can think of (and didn't develop since the scope of the task was in fact a demo):
1. Dependency injection (for instance using GetIt)
2. I didn't include the tabBar in the detail view, since i take into consideration that it was a bug, since having a tab bar in there would, eventually break the navigation and UX of the app (please correct if i'm wrong)
3. Even More extraction of Widgets