import 'package:flutter_web_task/fetaure/trip/data/model/trip_model.dart';

abstract class TripsState {}

class TripsInitial extends TripsState {}

class TripsLoading extends TripsState {}

class TripsLoaded extends TripsState {
  final List<Trip> trips;
  TripsLoaded(this.trips);
}

class TripsError extends TripsState {
  final String message;
  TripsError(this.message);
}