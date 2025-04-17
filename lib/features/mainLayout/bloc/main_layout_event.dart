part of 'main_layout_bloc.dart';

@immutable
sealed class MainLayoutEvent {}

class HoveredMenuEvent extends MainLayoutEvent {
  final int hoveredIndex;
  HoveredMenuEvent({required this.hoveredIndex});
}

class ChangeMenuEvent extends MainLayoutEvent {
  final int selectedIndex;
  ChangeMenuEvent({required this.selectedIndex});
}

class ExpandSideBarEvent extends MainLayoutEvent {
  final bool isExpand;
  ExpandSideBarEvent({required this.isExpand});
}
