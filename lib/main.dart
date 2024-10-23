import 'package:animation/features/home/presentation/views/widgets/side_menu.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/views/widgets/entry_point.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:
     {
       EntryPoint.id: (context)=>EntryPoint(),
     }
      ,
      home: SideMenu(),
    );
  }
}
