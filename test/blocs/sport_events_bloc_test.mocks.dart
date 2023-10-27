// Mocks generated by Mockito 5.4.2 from annotations
// in sports_master_detail/test/blocs/sport_events_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:sports_master_detail/models/sport_event.dart' as _i3;
import 'package:sports_master_detail/resources/api_repository.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApiRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepository extends _i1.Mock implements _i2.ApiRepository {
  MockApiRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.SportEvent> fetchSportEvents({String? date = r'today'}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSportEvents,
          [],
          {#date: date},
        ),
        returnValue: <_i3.SportEvent>[],
      ) as List<_i3.SportEvent>);
}
