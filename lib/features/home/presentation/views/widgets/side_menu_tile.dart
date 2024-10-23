import 'package:animation/features/home/presentation/views/data/models/rive_assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.prees,
    required this.riveonInit,
    required this.isActive,
  });
  final RiveAssets menu;
  final VoidCallback prees;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            height: 1,
            color: Colors.white24,
          ),
        ),
        ListTile(
          onTap: prees,
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveonInit,
            ),
          ),
          title: Text(
            menu.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
