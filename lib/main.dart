// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_web_task/fetaure/trip/bloc/trip_cubit.dart';
// import 'package:flutter_web_task/fetaure/trip/data/data%20source/trip_data_source.dart';
// import 'package:flutter_web_task/fetaure/trip/data/repo/trip_repo.dart';
// import 'package:flutter_web_task/fetaure/trip/presentation/screen/trip_screen.dart';

// void main() {
//   final repo = TripRepository(TripsLocalDataSource());
//   runApp(MyApp(repository: repo));
// }

// class MyApp extends StatelessWidget {
//   final TripRepository repository;

//   const MyApp({super.key, required this.repository});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => TripsCubit(repository)..loadTrips(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TripsPage(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_task/fetaure/trip/bloc/trip_cubit.dart';
import 'package:flutter_web_task/fetaure/trip/data/data%20source/trip_data_source.dart';
import 'package:flutter_web_task/fetaure/trip/data/repo/trip_repo.dart';
import 'package:flutter_web_task/fetaure/trip/presentation/ui/trip_screen.dart';

void main() {
  final repo = TripRepository(TripsLocalDataSource());

  runApp(MyApp(repository: repo));
}

class MyApp extends StatelessWidget {
  final TripRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => TripsCubit(repository)..loadTrips(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Trip Manager',
            // Set text scale factor to ensure responsive text
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: widget!,
              );
            },
            home: const TripsPage(),
          ),
        );
      },
    );
  }
}
