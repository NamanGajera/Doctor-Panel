part of 'main_layout_bloc.dart';

@immutable
class MainLayoutState extends Equatable {
  final int hoveredIndex;
  final int selectedIndex;
  final bool isExpanded;

  const MainLayoutState({
    this.hoveredIndex = 0,
    this.selectedIndex = 0,
    this.isExpanded = true,
  });

  @override
  List<Object?> get props => [
        hoveredIndex,
        selectedIndex,
        isExpanded,
      ];

  MainLayoutState copyWith({
    int? hoveredIndex,
    int? selectedIndex,
    bool? isExpanded,
  }) {
    return MainLayoutState(
      hoveredIndex: hoveredIndex ?? this.hoveredIndex,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

class MainLayoutInitialState extends MainLayoutState {}
