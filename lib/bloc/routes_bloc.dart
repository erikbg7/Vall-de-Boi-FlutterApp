import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:first_flutter_app/bloc/activities_event.dart';
import 'package:first_flutter_app/bloc/routes_state.dart';
import 'package:first_flutter_app/network/routes_repository.dart';

class RoutesBloc extends Bloc<ActivitiesEvent, RoutesListsState> {
  final RoutesRepository repository;

  RoutesBloc(this.repository);

  @override
  RoutesListsState get initialState => RoutesListsInitial();

  @override
  Stream<RoutesListsState> mapEventToState(
      ActivitiesEvent event,
      ) async* {
    // Emitting a state from the asynchronous generator
    yield RoutesListsLoading();
    // Branching the executed logic by checking the event type
    if (event is GetActivities) {
      // Emit either Loaded or Error
      try {
        final activities = await repository.getRoutesLists();
        yield RoutesListsLoaded(activities);
      } catch (e) {
        print('Error: $e');
        yield RoutesListsError(
            "Couldn't fetch activities. Is the device online?");
      }
    }
  }
}