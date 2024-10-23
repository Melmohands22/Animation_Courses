import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key, required this.prees, required this.riveOnInit,
  });
  final VoidCallback prees;
  final ValueChanged<Artboard> riveOnInit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: prees,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
              ]),
              child: RiveAnimation.asset("assets/RiveAssets/menu_button.riv"),
        ),
      )),
    );
  }
}
