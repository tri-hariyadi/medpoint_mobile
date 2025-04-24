import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpoint_mobile/domain/usecases/doctor/get_doctor.dart';
import 'package:medpoint_mobile/core/error/failure.dart';
import 'package:medpoint_mobile/domain/entities/doctor/doctor.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final GetDoctor getDoctor;

  DoctorCubit({required this.getDoctor}) : super(DoctorInitial());

  void fetchDoctors() async {
    emit(DoctorLoading());

    final userResult = await getDoctor();

    userResult.fold((failure) {
      emit(DoctorError(failure: failure));
    }, (users) {
      emit(DoctorSuccess(doctor: users));
    });
  }
}
