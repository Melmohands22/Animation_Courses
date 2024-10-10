import 'dart:ui';
import 'package:rive/rive.dart' as rive;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final rive.RiveAnimationController btnAnimationController;

  const AnimationButton({
    required this.onPressed,
    required this.btnAnimationController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            rive.RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [
                btnAnimationController
              ], 
            ),
            Positioned.fill(
              top: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.arrow_right),
                SizedBox(width: 10),
                  Text (
                    "Start the course",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
