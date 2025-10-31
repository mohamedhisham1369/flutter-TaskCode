
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_web_task/fetaure/trip/data/model/trip_model.dart';

class TripsLocalDataSource {
  Future<List<Trip>> getTrips() async {
    final jsonString = await rootBundle.loadString('assets/trips_mock.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final List tripsList = jsonMap['trips'];
    return tripsList.map((e) => Trip.fromJson(e)).toList();
  }
}

