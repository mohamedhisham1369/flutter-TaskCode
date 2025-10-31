import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_task/core/funcitons/date_format.dart';
import 'package:flutter_web_task/core/themes/assets.dart';
import 'package:flutter_web_task/core/themes/colors.dart';
import 'package:flutter_web_task/fetaure/trip/data/model/trip_model.dart';

import 'participants_and_task_widget.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Layer 1: Base Image
                CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: trip.coverImage,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        )),

              
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black
                              .withValues(alpha: AppColors.opacityIntense),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // Layer 3: Second gradient overlay (70px stronger fade)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // Layer 4: Status Badge with Glassmorphism
                Positioned(
                  bottom: 1,
                  left: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: AppColors.getStatusGradientWithOpacity(
                                trip.status),
                          ),
                          border: Border.all(
                            color: AppColors.getStatusBorderColor(trip.status),
                            width: 0.8,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              trip.status,
                              style: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (trip.status.toLowerCase() !=
                                'ready for travel') ...[
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.primaryText,
                                size: 14,
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Layer 5: More button (top right)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.moreButtonBackground
                          .withValues(alpha: AppColors.opacityGlass),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: AppColors.primaryText,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content section
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    trip.title,
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 10),

                  // Dates
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsImagesCalendar),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '5 Nights (${formatDateRange(trip.dates.start, trip.dates.end)})',
                          style: const TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 11,
                            height: 1.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Divider
                  Container(
                    height: 1,
                    color: AppColors.lightDividerColor,
                  ),

                  const SizedBox(height: 8),

                  // Participants and tasks
                  ParticipantsAndTaskWidget(trip: trip),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
