import 'package:animation/features/onboarding/presentation/views/widgets/animation_button.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/background_section.dart';
import 'package:animation/features/onboarding/presentation/views/custom_show_dailog.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/higher_section.dart';
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

  void _onButtonPressed() {
    setState(() {
      _btnanimationController.isActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundSection(),
          AnimatedPositioned(
            top: isSignInDialogShown ? -80 : 0,
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
                          HigherSection(),
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
