import 'dart:ui';
import 'package:rive/rive.dart' as rive;

import 'package:flutter/material.dart';

class BackgroundSection extends StatelessWidget {
  
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
 Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const rive.RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
      ],
    );
  }
}