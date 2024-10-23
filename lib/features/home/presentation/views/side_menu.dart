import 'package:animation/core/utilis/rive_utils.dart';
import 'package:animation/features/home/presentation/views/data/models/rive_assets.dart';
import 'package:animation/features/home/presentation/views/widgets/side_menu_tile.dart';
import 'package:animation/features/home/presentation/views/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xff17203a),
        child: SafeArea(
            child: Column(
          children: [
            const InfoCard(
              name: 'Mohamed Abdeltwab',
              profession: 'Flutter developer',
            ),
            Padding(
                padding: EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                )),
            ...SideMenus.map(
              (menu) => SideMenuTile(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                prees: () {
                  menu.input!.change(true);
                },
                isActive: false,
              ),
            )
          ],
        )),
      ),
    );
  }
}
