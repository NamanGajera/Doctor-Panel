import 'dart:developer';

import 'package:doctor_panel/core/extension/build_context_extenstion.dart';
import 'package:doctor_panel/features/mainLayout/page/widgets/main_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/global_keys.dart';
import '../bloc/main_layout_bloc.dart';
import 'widgets/side_bar.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isSmallScreen = screenWidth < 1100;
    log('screenWidth----->>>> $screenWidth');
    return Scaffold(
      key: mainLayoutScaffodKey,
      drawer: const Drawer(
        child: SideBar(),
      ),
      body: Row(
        children: [
          if (!isSmallScreen) const SideBar(),
          BlocBuilder<MainLayoutBloc, MainLayoutState>(
            builder: (context, state) {
              return Expanded(
                flex: state.isExpanded ? 11 : 16,
                child: MainContentView(child: widget.child),
              );
            },
          ),
        ],
      ),
    );
  }
}
