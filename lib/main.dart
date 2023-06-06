import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_libreria_upec/pages/inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: InicioPage()),
    );
  }
}
