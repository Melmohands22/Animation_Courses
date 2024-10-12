import 'dart:ui';
import 'package:animation/features/onboarding/presentation/views/widgets/animation_button.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/custom_show_dailog.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late rive.RiveAnimationController _btnanimationController;
  bool isSignInDialogShown = false;
  @override
  void initState() {
    super.initState();
    _btnanimationController = rive.OneShotAnimation(
      "active",
      autoplay: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .0999,
                    ),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          const Text(
                            'Practice Design & Code',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 60,
                                height: 1.2),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "I'm trying to create an awesome UI apps using my knowledge in Flutter in this app which presents a group of courses ",
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                          ),
                          AnimationButton(
                            btnAnimationController: _btnanimationController,
                            onPressed: () {
                              _btnanimationController.isActive = true;
                              Future.delayed(Duration(milliseconds: 800), () {
                                CustomShowDialog(context, onClosed: (_) {
                                  setState(() {
                                    isSignInDialogShown = false;
                                  });
                                });
                                setState(() {
                                  isSignInDialogShown = true;
                                });
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Text(
                              "Purchase includes access to 20+ courses, 240+ premium tutorials, 120 hours of videos, source files and certificates",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
