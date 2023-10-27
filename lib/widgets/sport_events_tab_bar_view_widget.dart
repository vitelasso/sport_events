import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_master_detail/blocs/sport_events_bloc.dart';
import 'package:sports_master_detail/resources/api_repository.dart';
import 'package:sports_master_detail/widgets/sport_events_list_widget.dart';

class SportEventsTabBarViewWidget extends StatelessWidget {
  final String date;

  const SportEventsTabBarViewWidget({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: Key(date),
      create: (_) => SportEventsBloc(repository: ApiRepository())
        ..add(GetSportEventsList(date: date)),
      child: BlocListener<SportEventsBloc, SportEventsState>(
        listener: (context, state) {
          if (state is SportEventsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<SportEventsBloc, SportEventsState>(
            builder: (context, state) {
          if (state is SportEventsInitial) {
            return _buildLoading();
          } else if (state is SportEventsLoading) {
            return _buildLoading();
          } else if (state is SportEventsLoaded) {
            return SportEventsListWidget(date: date, events: state.events);
          } else if (state is SportEventsError) {
            return _buildError();
          } else {
            return _buildError();
          }
        }),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError() =>
      const Center(child: Text('Oops! Something Wrong Happened!'));
}
