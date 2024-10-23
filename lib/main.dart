import 'package:flutter/material.dart';

import 'features/home/presentation/views/widgets/entry_point.dart';
import 'features/onboarding/presentation/views/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        EntryPoint.id: (context) => EntryPoint(),
      },
      home: OnboardingView(),
    );
  }
}
