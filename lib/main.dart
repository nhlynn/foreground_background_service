import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../home_page.dart';

import '../my_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then(
      (value){
        if(value){
          Permission.notification.request();
        }
      }
  );
  await initializeService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
