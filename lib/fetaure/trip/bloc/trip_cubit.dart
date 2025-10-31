import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_task/fetaure/trip/bloc/trip_state.dart';
import 'package:flutter_web_task/fetaure/trip/data/repo/trip_repo.dart';

class TripsCubit extends Cubit<TripsState> {
  final TripRepository repository;
  TripsCubit(this.repository) : super(TripsInitial());

  Future<void> loadTrips() async {
    emit(TripsLoading());
    try {
      final trips = await repository.getTrips();
      emit(TripsLoaded(trips));
    } catch (e) {
      emit(TripsError(e.toString()));
    }
  }
}
