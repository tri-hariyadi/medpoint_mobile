import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:medpoint_mobile/data/datasource/doctor/doctor_remote_data_source.dart';
import 'package:medpoint_mobile/data/repositories/doctor/doctor_repository_impl.dart';
import 'package:medpoint_mobile/domain/repositories/doctor/doctor_repository.dart';
import 'package:medpoint_mobile/domain/usecases/doctor/get_doctor.dart';
import 'package:medpoint_mobile/presentation/cubit/doctor/doctor_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  final supabase = await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'] ?? '',
      anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '');

  /// Supabase
  locator.registerLazySingleton(() => supabase.client);

  /// Data source
  locator.registerLazySingleton<DoctorRemoteDataSource>(
    () => DoctorRemoteDataSourceImpl(supabaseClient: locator.get()),
  );

  /// Repository
  locator.registerLazySingleton<DoctorRepository>(
    () => DoctorRepositoryImpl(locator.get()),
  );

  /// Usecases
  locator.registerLazySingleton<GetDoctor>(
    () => GetDoctor(doctorRepository: locator.get()),
  );

  /// Cubit
  locator.registerLazySingleton<DoctorCubit>(
    () => DoctorCubit(getDoctor: locator.get()),
  );
}
