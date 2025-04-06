part of 'profile_screen_bloc.dart';

@immutable
sealed class ProfileScreenEvent {}

class ChangeStepperEvent extends ProfileScreenEvent {
  final int index;
  ChangeStepperEvent({required this.index});
}
