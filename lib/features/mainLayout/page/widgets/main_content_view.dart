import 'package:doctor_panel/core/constants/images.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:doctor_panel/features/mainLayout/bloc/main_layout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/constants/widgets.dart';

class MainContentView extends StatelessWidget {
  final Widget child;

  const MainContentView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(
              message: 'Chat',
              child: CustomIconContainer(
                iconPath: AppIcons.chatIcon,
                backgroundColor: Colors.white,
                borderRadius: 40,
                isSvg: true,
                borderColor: Colors.grey.shade300,
                height: 18,
                width: 18,
                padding: 8,
              ),
            ),
            const SizedBox(width: 15),
            Tooltip(
              message: 'Notification',
              child: CustomIconContainer(
                iconPath: AppIcons.notificationIcon,
                backgroundColor: Colors.white,
                borderRadius: 40,
                isSvg: true,
                borderColor: Colors.grey.shade300,
                height: 18,
                width: 18,
                padding: 8,
              ),
            ),
            const SizedBox(width: 15),
            Tooltip(
              message: 'Setting',
              child: CustomIconContainer(
                iconPath: AppIcons.settingIcon,
                backgroundColor: Colors.white,
                borderRadius: 40,
                isSvg: true,
                borderColor: Colors.grey.shade300,
                height: 18,
                width: 18,
                padding: 8,
              ),
            ),
            const SizedBox(width: 30),
            CustomIconContainer(
              iconPath: AppImages.doctorProfile,
              backgroundColor: Colors.white,
              borderRadius: 40,
              padding: 0,
              borderColor: Colors.grey.shade300,
              height: 35,
              width: 35,
            ),
            const SizedBox(width: 6),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Naman Gajera',
                  fontSize: 12,
                  height: 0,
                ),
                CustomText(
                  'Dentist',
                  fontSize: 10,
                ),
              ],
            ),
            const SizedBox(width: 30),
          ],
        ).withPadding(const EdgeInsets.symmetric(vertical: 10)),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
