import 'package:dartz/dartz.dart';
import 'package:medpoint_mobile/core/error/failure.dart';
import 'package:medpoint_mobile/domain/entities/doctor/doctor.dart';

abstract interface class DoctorRepository {
  Future<Either<Failure, List<Doctor>>> getDoctors();
}
