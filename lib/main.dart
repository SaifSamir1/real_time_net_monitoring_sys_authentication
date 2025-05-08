import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utils/my_hive_box.dart';
import 'firebase_options.dart';
import 'my_web_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  myBox = await openHiveBox("AuthBox");
  runApp(const MyWebApp());
}
