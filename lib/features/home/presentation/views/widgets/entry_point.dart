import 'package:animation/core/utilis/rive_utils.dart';
import 'package:animation/features/home/presentation/views/data/models/rive_assets.dart';
import 'package:animation/features/home/presentation/views/home_view.dart';
import 'package:animation/features/home/presentation/views/widgets/animated_bar.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});
  static String id = "Entry Point";

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAssets selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const HomeView(),
      bottomNavigationBar: Container(
        padding:const EdgeInsets.all(12),
        margin:const EdgeInsets.symmetric(horizontal: 24),
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
                            isActive: bottomNavs[index] == selectedBottomNav,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.11 / 2,
                              width:
                                  MediaQuery.of(context).size.width * 0.25 / 2,
                              child: Opacity(
                                opacity: bottomNavs[index] == selectedBottomNav
                                    ? 1
                                    : 0.5,
                                child: rive.RiveAnimation.asset(
                                  bottomNavs.first.src,
                                  artboard: bottomNavs[index].artboard,
                                  onInit: (artboard) {
                                    rive.StateMachineController controller =
                                        RiveUtils.getRiveController(artboard,
                                            stateMachineName: bottomNavs[index]
                                                .stateMachineName);
                                    bottomNavs[index].input =
                                        controller.findSMI("active") as SMIBool;
                                  },
                                ),
                              )),
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
