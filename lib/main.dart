import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:teste/Config/hive_config.dart';

import 'MeuAplicativo.dart';
import 'pages/login/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MeuAplicativo(),
    ),
  );
}














// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PERSOUFIT',
//       home: LoginPage(),
//     );
//   }
// }
