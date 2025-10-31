import 'package:flutter_web_task/fetaure/trip/data/data%20source/trip_data_source.dart';
import 'package:flutter_web_task/fetaure/trip/data/model/trip_model.dart';

class TripRepository {
  final TripsLocalDataSource localDataSource;

  TripRepository(this.localDataSource);

  Future<List<Trip>> getTrips() => localDataSource.getTrips();
}
