import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medpoint_mobile/app.dart';
import 'package:medpoint_mobile/presentation/cubit/doctor/doctor_cubit.dart';
import 'package:medpoint_mobile/utils/supabaseClient.dart';
import './di/locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
    await di.setup();
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DoctorCubit(getDoctor: di.locator.get()),
        ),
      ],
      child: const App(),
    ));
  } catch (e) {
    if (kDebugMode) {
      print("Error: $e");
    }
  }
}
