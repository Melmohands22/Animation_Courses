import 'package:animation/core/utilis/rive_utils.dart';
import 'package:animation/features/home/presentation/views/data/models/rive_assets.dart';
import 'package:animation/features/home/presentation/views/widgets/side_menu_tile.dart';
import 'package:animation/features/home/presentation/views/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAssets selectedMenu = SideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * (2 / 3),
        height: double.infinity,
        color: Color(0xff17203a),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(
              name: 'Mohamed Abdeltwab',
              profession: 'Flutter developer',
            ),
            Padding(
                padding:const EdgeInsets.only(left: 24, top: 32, bottom: 16),
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
                  Future.delayed(Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
            Padding(
                padding:const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "history".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                )),
            ...SideMenus2.map(
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
                  Future.delayed(const Duration ( seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
