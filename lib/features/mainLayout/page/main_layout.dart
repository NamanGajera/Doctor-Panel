import 'package:doctor_panel/features/mainLayout/page/widgets/main_content_view.dart';
import 'package:flutter/material.dart';

import 'widgets/side_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: MainContentView(child: child),
          ),
        ],
      ),
    );
  }
}
