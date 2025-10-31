import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/themes/colors.dart';
import 'package:flutter_web_task/fetaure/trip/data/model/trip_model.dart';

class ParticipantsAndTaskWidget extends StatelessWidget {
  const ParticipantsAndTaskWidget({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar stack
        Expanded(
          child: SizedBox(
            height: 24,
            child: Stack(
              children: [
                for (int i = 0;
                    i <
                        (trip.participants.length > 3
                            ? 3
                            : trip.participants.length);
                    i++)
                  Positioned(
                    left: i * 18.0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.cardBackground,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: trip.participants[i].avatarUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.dividerColor,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.dividerColor,
                            child: const Icon(Icons.person,
                                size: 12, color: AppColors.primaryText),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (trip.participants.length > 3)
                  Positioned(
                    left: 54.0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.dividerColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.cardBackground,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '+${trip.participants.length - 3}',
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 4),

        // Unfinished tasks
        Flexible(
          child: Text(
            '${trip.unfinishedTasks} unfinished tasks',
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 10,
              height: 1.2,
            ),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
