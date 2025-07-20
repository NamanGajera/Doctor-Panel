import 'package:doctor_panel/core/constants/colors.dart';
import 'package:doctor_panel/core/constants/global_keys.dart';
import 'package:doctor_panel/core/constants/images.dart';
import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/widgets.dart';

class MainContentView extends StatefulWidget {
  final Widget child;

  const MainContentView({
    super.key,
    required this.child,
  });

  @override
  State<MainContentView> createState() => _MainContentViewState();
}

class _MainContentViewState extends State<MainContentView> {
  final GlobalKey _popupKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isSmallScreen = screenWidth < 1100;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (screenWidth > 520) {
        Navigator.of(context, rootNavigator: true).popUntil((route) {
          return route.isFirst || !route.willHandlePopInternally;
        });
      }
    });

    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isSmallScreen)
                  const Icon(Icons.menu)
                      .withPadding(const EdgeInsets.only(left: 20))
                      .onTap(() {
                    mainLayoutScaffodKey.currentState?.openDrawer();
                  }),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      key: _popupKey,
                      offset: const Offset(-20, 45),
                      color: Colors.white,
                      elevation: 8,
                      borderRadius: BorderRadius.circular(16),
                      menuPadding: const EdgeInsets.all(8),
                      icon: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const CustomIconContainer(
                          iconPath: AppImages.doctorProfile,
                          backgroundColor: Colors.transparent,
                          borderRadius: 40,
                          padding: 0,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      itemBuilder: (context) => [
                        // Chat Option
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: ModernMenuItem(
                            icon: Icons.chat_bubble_outline_rounded,
                            title: 'Messages',
                            subtitle: '3 unread',
                            onTap: () {
                              Navigator.pop(context);
                              // Handle chat navigation
                            },
                          ),
                        ),

                        // Notification Option
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: ModernMenuItem(
                            icon: Icons.notifications_outlined,
                            title: 'Notifications',
                            subtitle: '5 new alerts',
                            badge: true,
                            onTap: () {
                              Navigator.pop(context);
                              // Handle notification navigation
                            },
                          ),
                        ),

                        // Settings Option
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: ModernMenuItem(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                            subtitle: 'Manage account',
                            onTap: () {
                              Navigator.pop(context);
                              // Handle settings navigation
                            },
                          ),
                        ),

                        // Divider
                        PopupMenuItem(
                          enabled: false,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                            height: 1,
                          ),
                        ),

                        // Logout Option
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          child: ModernMenuItem(
                            icon: Icons.logout_rounded,
                            title: 'Sign Out',
                            subtitle: 'Logout securely',
                            isLogout: true,
                            onTap: () {
                              Navigator.pop(context);
                              // Handle logout
                            },
                          ),
                        ),
                      ],
                    ),
                    if (screenWidth > 520) const SizedBox(width: 6),
                    if (screenWidth > 520)
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
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget class for menu items to handle hover properly
class ModernMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool badge;
  final bool isLogout;
  final VoidCallback onTap;

  const ModernMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badge = false,
    this.isLogout = false,
    required this.onTap,
  });

  @override
  State<ModernMenuItem> createState() => _ModernMenuItemState();
}

class _ModernMenuItemState extends State<ModernMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isHovered
                ? primaryDarkBlueColor.withValues(alpha: 0.08)
                : Colors.transparent,
            border: Border.all(
              color: isHovered
                  ? primaryDarkBlueColor.withValues(alpha: 0.2)
                  : Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Icon with badge
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isHovered
                          ? primaryDarkBlueColor.withValues(alpha: 0.15)
                          : primaryDarkBlueColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.isLogout
                          ? Colors.red.shade600
                          : primaryDarkBlueColor,
                      size: 20,
                    ),
                  ),
                  if (widget.badge)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),

              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.isLogout
                            ? Colors.red.shade600
                            : Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.isLogout
                            ? Colors.red.shade500
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow indicator
              AnimatedRotation(
                duration: const Duration(milliseconds: 200),
                turns: isHovered ? 0.05 : 0,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: primaryDarkBlueColor.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
