import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_layout_event.dart';
part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  MainLayoutBloc() : super(MainLayoutInitialState()) {
    on<HoveredMenuEvent>(_hoveredMenu);
    on<ChangeMenuEvent>(_changeMenu);
    on<ExpandSideBarEvent>(_expandSideBar);
  }

  void _hoveredMenu(HoveredMenuEvent event, Emitter<MainLayoutState> emit) {
    emit(state.copyWith(hoveredIndex: event.hoveredIndex));
  }

  void _changeMenu(ChangeMenuEvent event, Emitter<MainLayoutState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  void _expandSideBar(ExpandSideBarEvent event, Emitter<MainLayoutState> emit) {
    emit(state.copyWith(isExpanded: event.isExpand));
  }
}
