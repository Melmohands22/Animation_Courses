import 'package:flutter/material.dart';

class HigherSection extends StatelessWidget {
  const HigherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Practice Design & Code',
          style: TextStyle(fontFamily: "Poppins", fontSize: 60, height: 1.2),
        ),
        const SizedBox(height: 16),
        const Text(
          "I'm trying to create an awesome UI apps using my knowledge in Flutter in this app which presents a group of courses ",
        ),
      ],
    );
  }
}
