import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_task/fetaure/trip/data/model/trip_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/trip_card.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.horizontalPadding,
  });

  final bool isMobile;
  final bool isTablet;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    List<Trip> trips = [
      Trip(
        id: '2',
        status: 'Proposal Sent',
        title: 'Adventure in Iceland',
        dates: TripDates(start: '05-02-2024', end: '12-02-2024'),
        participants: [
          Participant(
            name: 'David',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          Participant(
            name: 'Emma',
            avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
          ),
        ],
        unfinishedTasks: 5,
        coverImage:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      ),
      Trip(
        id: '2',
        status: 'Proposal Sent',
        title: 'Adventure in Iceland',
        dates: TripDates(start: '05-02-2024', end: '12-02-2024'),
        participants: [
          Participant(
            name: 'David',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          Participant(
            name: 'Emma',
            avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
          ),
        ],
        unfinishedTasks: 5,
        coverImage:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      ),
      Trip(
        id: '2',
        status: 'Proposal Sent',
        title: 'Adventure in Iceland',
        dates: TripDates(start: '05-02-2024', end: '12-02-2024'),
        participants: [
          Participant(
            name: 'David',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          Participant(
            name: 'Emma',
            avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
          ),
        ],
        unfinishedTasks: 5,
        coverImage:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      ),
      Trip(
        id: '2',
        status: 'Proposal Sent',
        title: 'Adventure in Iceland',
        dates: TripDates(start: '05-02-2024', end: '12-02-2024'),
        participants: [
          Participant(
            name: 'David',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          Participant(
            name: 'Emma',
            avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
          ),
        ],
        unfinishedTasks: 5,
        coverImage:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      ),
      Trip(
        id: '2',
        status: 'Proposal Sent',
        title: 'Adventure in Iceland',
        dates: TripDates(start: '05-02-2024', end: '12-02-2024'),
        participants: [
          Participant(
            name: 'David',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          Participant(
            name: 'Emma',
            avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
          ),
        ],
        unfinishedTasks: 5,
        coverImage:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      ),
      Trip(
        id: '2',
        status: 'Proposal Sent',
        title: 'Adventure in Iceland',
        dates: TripDates(start: '05-02-2024', end: '12-02-2024'),
        participants: [
          Participant(
            name: 'David',
            avatarUrl: 'https://randomuser.me/api/portraits/men/12.jpg',
          ),
          Participant(
            name: 'Emma',
            avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
          ),
        ],
        unfinishedTasks: 5,
        coverImage:
            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      ),
    ];
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

    return Skeletonizer(
      enabled: true,
      child: CustomScrollView(
        slivers: [
          // Header section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(horizontalPadding,
                  isMobile ? 20 : 32, horizontalPadding, isMobile ? 16 : 24),
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
      ),
    );
  }
}
