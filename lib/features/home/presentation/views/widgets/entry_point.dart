import 'package:animation/core/utilis/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});
  static String id = "entry Point";

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late SMIBool searchTrigger;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color(0xff173540).withOpacity(0.8),
            borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                searchTrigger.change(true);
              },
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12 / 2,
                  width: MediaQuery.of(context).size.width * 0.25 / 2,
                  child: rive.RiveAnimation.asset(
                    "assets/RiveAssets/icons.riv",
                    artboard: "SEARCH",
                    onInit: (artboard) {
                      rive.StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: "SEARCH_Interactivity");
                      searchTrigger = controller.findInput("SEARCH") as SMIBool;
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
