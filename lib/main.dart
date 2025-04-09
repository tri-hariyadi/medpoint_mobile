import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medpoint_mobile/app.dart';
import 'package:medpoint_mobile/utils/supabaseClient.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
    await initSupabase();
    runApp(const App());
  } catch (e) {
    if (kDebugMode) {
      print("Error: $e");
    }
  }
}
