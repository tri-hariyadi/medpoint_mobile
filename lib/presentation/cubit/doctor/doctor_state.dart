part of 'doctor_cubit.dart';

sealed class DoctorState {
  const DoctorState();
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorSuccess extends DoctorState {
  final List<Doctor> doctor;

  const DoctorSuccess({required this.doctor});
}

class DoctorError extends DoctorState {
  final Failure failure;

  const DoctorError({required this.failure});
}
