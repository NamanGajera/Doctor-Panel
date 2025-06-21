import 'package:doctor_panel/core/constants/global_keys.dart';
import 'package:doctor_panel/core/constants/images.dart';
import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';
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
    final screenWidth = context.screenWidth;
    final isSmallScreen = screenWidth < 1100;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isSmallScreen)
              const Icon(Icons.menu)
                  .withPadding(const EdgeInsets.only(left: 20))
                  .onTap(() {
                // log('MainScreenWidgth ===>>> ${context.screenWidth}');
                mainLayoutScaffodKey.currentState?.openDrawer();
              }),
            const Spacer(),
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
            ),
          ],
        ).withPadding(const EdgeInsets.symmetric(vertical: 10)),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
