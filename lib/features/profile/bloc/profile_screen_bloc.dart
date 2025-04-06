import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenInitialState()) {
    on<ChangeStepperEvent>(_changeStep);
  }

  void _changeStep(ChangeStepperEvent event, Emitter<ProfileScreenState> emit) {
    emit(state.copyWith(stepIndex: event.index));
  }
}
