import 'package:doctor_panel/features/mainLayout/page/widgets/main_content_view.dart';
import 'package:flutter/material.dart';

import 'widgets/side_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SideBar(),
          MainContentView(),
        ],
      ),
    );
  }
}
