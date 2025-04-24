import 'package:flutter/material.dart';

import '../../../../core/constants/widgets.dart';

class AppointmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String iconPath;
  final Color iconBackgroundColor;
  final Color cardColor;
  final String trendValue;
  final bool trendPositive;
  final bool showMoreButton;
  final bool urgent;

  const AppointmentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.iconPath,
    required this.iconBackgroundColor,
    required this.cardColor,
    this.trendValue = '',
    this.trendPositive = false,
    this.showMoreButton = false,
    this.urgent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconContainer(
                iconPath: iconPath,
                backgroundColor: iconBackgroundColor,
                borderRadius: 40,
                isSvg: true,
                height: 17,
                width: 17,
                padding: 7,
              ),
              if (showMoreButton)
                CustomIconContainer(
                  iconData: Icons.more_horiz,
                  iconColor: Colors.black,
                  backgroundColor: cardColor.withOpacity(0.7),
                  borderRadius: 40,
                  iconsSize: 20,
                  padding: 8,
                )
              else if (urgent)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Urgent',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CustomText(
                value,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 10),
              if (trendValue.isNotEmpty && trendPositive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_upward, color: Colors.green, size: 14),
                      const SizedBox(width: 4),
                      CustomText(
                        trendValue,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          CustomText(
            title,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            subtitle,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
