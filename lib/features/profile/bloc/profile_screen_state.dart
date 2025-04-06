part of 'profile_screen_bloc.dart';

@immutable
class ProfileScreenState extends Equatable {
  final int stepIndex;

  const ProfileScreenState({
    this.stepIndex = 0,
  });

  ProfileScreenState copyWith({
    int? stepIndex,
  }) {
    return ProfileScreenState(
      stepIndex: stepIndex ?? this.stepIndex,
    );
  }

  @override
  List<Object?> get props => [
        stepIndex,
      ];
}

class ProfileScreenInitialState extends ProfileScreenState {}
