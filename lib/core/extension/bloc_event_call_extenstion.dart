import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/mainLayout/bloc/main_layout_bloc.dart';

extension MainLayoutBlocX on BuildContext {
  void addMainLayoutEvent(MainLayoutEvent event) {
    read<MainLayoutBloc>().add(event);
  }
}
