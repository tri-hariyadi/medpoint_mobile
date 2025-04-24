import 'package:medpoint_mobile/core/error/exception.dart';
import 'package:medpoint_mobile/data/models/doctor/doctor_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  final SupabaseClient supabaseClient;

  DoctorRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<DoctorModel>> getDoctors() async {
    try {
      await supabaseClient.auth.signInWithPassword(
        password: '12345678',
        email: 'trihariyadi@mail.com',
      );
      final doctors = await supabaseClient.from('doctors').select(
            'id, specialization, experience, created_at, users(full_name, avatar, email, phone, created_at)',
          );
      return doctors
          .map(
            (doctor) => DoctorModel.fromJson(doctor).copyWith(
              name: doctor["users"]["full_name"],
              avatar: doctor["users"]["avatar"],
            ),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
