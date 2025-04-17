import 'package:flutter/material.dart';

class MainContentView extends StatefulWidget {
  const MainContentView({super.key});

  @override
  State<MainContentView> createState() => _MainContentViewState();
}

class _MainContentViewState extends State<MainContentView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(),
    );
  }
}
