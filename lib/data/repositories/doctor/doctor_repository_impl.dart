import 'package:dartz/dartz.dart';
import 'package:medpoint_mobile/core/error/exception.dart';
import 'package:medpoint_mobile/core/error/failure.dart';
import 'package:medpoint_mobile/data/datasource/doctor/doctor_remote_data_source.dart';
import 'package:medpoint_mobile/domain/entities/doctor/doctor.dart';
import 'package:medpoint_mobile/domain/repositories/doctor/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRepositoryImpl(this.doctorRemoteDataSource);

  @override
  Future<Either<Failure, List<Doctor>>> getDoctors() async {
    try {
      final result = await doctorRemoteDataSource.getDoctors();
      final doctors = result.map((doctor) => doctor.toEntity()).toList();
      return right(doctors);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
