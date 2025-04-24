import 'package:dartz/dartz.dart';
import 'package:medpoint_mobile/core/error/failure.dart';
import 'package:medpoint_mobile/domain/entities/doctor/doctor.dart';
import 'package:medpoint_mobile/domain/repositories/doctor/doctor_repository.dart';

class GetDoctor {
  final DoctorRepository doctorRepository;

  GetDoctor({required this.doctorRepository});

  Future<Either<Failure, List<Doctor>>> call() {
    return doctorRepository.getDoctors();
  }
}
