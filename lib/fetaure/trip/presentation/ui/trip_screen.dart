import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_task/core/responsive.dart';
import 'package:flutter_web_task/fetaure/trip/bloc/trip_cubit.dart';
import 'package:flutter_web_task/fetaure/trip/bloc/trip_state.dart';
import 'package:flutter_web_task/fetaure/trip/presentation/widgets/skelton_widget.dart';

import '../widgets/app_bar_for_web.dart';
import '../widgets/app_bar_mobile.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/trip_card.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 40.0 : 120.0);

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      drawer: isMobile || isTablet ? DrawerWidget() : null,
      appBar: isMobile || isTablet
          ? AppBarMobile()
          : AppBarForWeb(horizontalPadding: horizontalPadding),
      body: BlocBuilder<TripsCubit, TripsState>(
        builder: (context, state) {
          if (state is TripsLoading) {
            return SkeltonWidget(
                isMobile: isMobile,
                isTablet: isTablet,
                horizontalPadding: horizontalPadding);
          } else if (state is TripsLoaded) {
            final trips = state.trips;
            int crossAxisCount = 1;
            double mainAxisHeight = 200;

            if (isMobile) {
              crossAxisCount = 1;
              mainAxisHeight = 230;
            } else if (isTablet) {
              crossAxisCount = 2;
              mainAxisHeight = 250;
            } else {
              crossAxisCount = 5;
              mainAxisHeight = 280;
            }

            return CustomScrollView(
              slivers: [
                // Header section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        isMobile ? 20 : 32,
                        horizontalPadding,
                        isMobile ? 16 : 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 24 : 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff171717),
                              child: const Icon(
                                Icons.tune,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            if (!isMobile) ...[
                              10.horizontalSpace,
                              Container(
                                height: 40,
                                width: 1,
                                color: const Color(0xFF2D2D2D),
                              ),
                              10.horizontalSpace,
                              const SizedBox(width: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 16 : 24,
                                  vertical: isMobile ? 10 : 14,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffFFC268),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.add,
                                        color: Colors.black, size: 20),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Add a New Item',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Grid section
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                      horizontalPadding, 0, horizontalPadding, 24),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: isMobile ? 16 : 20,
                        mainAxisSpacing: isMobile ? 16 : 20,
                        mainAxisExtent: mainAxisHeight),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => TripCard(trip: trips[index]),
                      childCount: trips.length,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is TripsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
