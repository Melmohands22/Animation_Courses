import 'dart:math';

import 'package:animation/core/utilis/rive_utils.dart';
import 'package:animation/features/home/presentation/views/data/models/rive_assets.dart';
import 'package:animation/features/home/presentation/views/home_view.dart';
import 'package:animation/features/home/presentation/views/side_menu.dart';
import 'package:animation/features/home/presentation/views/widgets/animated_bar.dart';
import 'package:animation/features/home/presentation/views/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});
  static String id = "Entry Point";

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAssets selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClosed;
  late bool isSideMenuClosed = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 1.09).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17203a),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: isSideMenuClosed ? -290 : 0,
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: isSideMenuClosed ? scaleAnimation.value : 0.80,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: const HomeView(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 200),
            top: 16,
            left: isSideMenuClosed ? 0 : 230,
            child: MenuButton(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                isSideBarClosed.value = true;
              },
              prees: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: Color(0xff173540).withOpacity(0.8),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                          onTap: () {
                            bottomNavs[index].input!.change(true);
                            if (bottomNavs[index] != selectedBottomNav) {
                              setState(() {
                                selectedBottomNav = bottomNavs[index];
                              });
                            }
                            Future.delayed(const Duration(seconds: 1), () {
                              bottomNavs[index].input!.change(false);
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedBar(
                                isActive:
                                    bottomNavs[index] == selectedBottomNav,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.11 /
                                      2,
                                  width: MediaQuery.of(context).size.width *
                                      0.25 /
                                      2,
                                  child: Opacity(
                                    opacity:
                                        bottomNavs[index] == selectedBottomNav
                                            ? 1
                                            : 0.5,
                                    child: rive.RiveAnimation.asset(
                                      bottomNavs.first.src,
                                      artboard: bottomNavs[index].artboard,
                                      onInit: (artboard) {
                                        rive.StateMachineController controller =
                                            RiveUtils.getRiveController(
                                                artboard,
                                                stateMachineName:
                                                    bottomNavs[index]
                                                        .stateMachineName);
                                        bottomNavs[index].input = controller
                                            .findSMI("active") as SMIBool;
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
