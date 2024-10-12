import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive/rive.dart';

class RiveUtils {
  static rive.StateMachineController getRiveController(Artboard artboard,
      {stateMachineName = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    if (controller != null) {
      artboard.addController(controller);
    } else {
      debugPrint("State Machine Controller not found");
    }

    return controller!;
  }
}
