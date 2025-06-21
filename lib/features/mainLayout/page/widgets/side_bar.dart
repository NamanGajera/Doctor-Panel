import 'package:doctor_panel/core/constants/global_keys.dart';
import 'package:doctor_panel/core/constants/icons.dart';
import 'package:doctor_panel/core/constants/images.dart';
import 'package:doctor_panel/core/constants/widgets.dart';
import 'package:doctor_panel/core/extension/bloc_event_call_extenstion.dart';
import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:doctor_panel/features/mainLayout/bloc/main_layout_bloc.dart';
import 'package:doctor_panel/routers/route_names.dart';
import 'package:doctor_panel/routers/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<String> routeNames = [
    dashboardPageName,
    appointmentPageName,
    patientPageName,
    calendarPageName,
    chatPageName,
    prescriptionPageName,
    helpSupportPageName,
    settingPageName,
  ];

  List<String> sideBarMenuIcons = [
    AppIcons.dashboardIcon,
    AppIcons.appointmentIcon,
    AppIcons.personIcon,
    AppIcons.calendarIcon,
    AppIcons.chatIcon,
    AppIcons.prescriptionsIcon,
    AppIcons.helpIcon,
    AppIcons.settingIcon,
  ];

  List<String> sideBarMenuName = [
    'Dashboard',
    'Appointment',
    'Patient',
    'Calendar',
    'Chat',
    'Prescription',
    'Help & Supports',
    'Setting',
  ];

  @override
  Widget build(BuildContext context) {
    // Check if the screen width is small
    final screenWidth = context.screenWidth;
    final isSmallScreen = screenWidth < 1100;

    return BlocBuilder<MainLayoutBloc, MainLayoutState>(
      builder: (context, state) {
        // if (isSmallScreen && state.isExpanded) {
        //   context.addMainLayoutEvent(ExpandSideBarEvent(isExpand: false));
        // }

        return Expanded(
          flex: state.isExpanded ? 2 : 1,
          child: Container(
            height: context.screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo and Toggle Button Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      if (state.isExpanded) ...[
                        Image.asset(
                          AppImages.appLogo,
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: RichText(
                            maxLines: 1,
                            text: const TextSpan(
                              text: 'Doctor',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'House',
                                  style: TextStyle(
                                    color: logoBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      // Toggle button using a custom container instead of IconButton
                      GestureDetector(
                        onTap: () {
                          if (!isSmallScreen) {
                            context.addMainLayoutEvent(ExpandSideBarEvent(
                                isExpand: !state.isExpanded));
                          } else {
                            mainLayoutScaffodKey.currentState?.closeDrawer();
                          }
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            width: state.isExpanded ? 28 : 45,
                            height: state.isExpanded ? 28 : 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                state.isExpanded
                                    ? Icons.chevron_left
                                    : Icons.chevron_right,
                                color: Colors.black54,
                                size: state.isExpanded ? 18 : 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                /// Menu Items
                Expanded(
                  child: ListView.builder(
                    itemCount: sideBarMenuName.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final isSelected = state.selectedIndex == index;
                      final isHovered = state.hoveredIndex == index;

                      return Tooltip(
                        message: state.isExpanded ? '' : sideBarMenuName[index],
                        child: MouseRegion(
                          onEnter: (_) {
                            context.addMainLayoutEvent(
                                HoveredMenuEvent(hoveredIndex: index));
                          },
                          onExit: (_) {
                            context.addMainLayoutEvent(
                                HoveredMenuEvent(hoveredIndex: -1));
                          },
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              context.addMainLayoutEvent(
                                  ChangeMenuEvent(selectedIndex: index));
                              appRouter.goNamed(routeNames[index]);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: state.isExpanded ? 12 : 15,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? primaryDarkBlueColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isHovered && !isSelected
                                      ? primaryDarkBlueColor.withValues(
                                          alpha: 0.5)
                                      : isSelected
                                          ? primaryDarkBlueColor
                                          : Colors.transparent,
                                ),
                              ),
                              transform: isHovered && !isSelected
                                  ? (Matrix4.identity()..scale(1.03))
                                  : Matrix4.identity(),
                              child: Row(
                                mainAxisAlignment: state.isExpanded
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    sideBarMenuIcons[index],
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black54,
                                    height: 20,
                                    width: 20,
                                  ),
                                  if (state.isExpanded) ...[
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CustomText(
                                        sideBarMenuName[index],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black87,
                                          fontWeight: isSelected || isHovered
                                              ? FontWeight.w500
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
