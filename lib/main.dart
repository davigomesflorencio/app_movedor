import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}
