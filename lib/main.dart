import 'package:farms/firebase_options.dart';
import 'package:farms/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        title: 'Farm MS',
        // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),useMaterial3: true,),
        home: Login());
  }
}
