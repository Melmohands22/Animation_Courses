import 'dart:ui';
import 'package:animation/features/onboarding/presentation/views/widgets/animation_button.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late rive.RiveAnimationController _btnanimationController;

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
          SafeArea(
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
                              fontFamily: "Poppins", fontSize: 60, height: 1.2),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "I'm trying to create an awesome UI apps using my knowledge in Flutter in this app which presents a group of courses ",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                        ),
                        AnimationButton(
                          onPressed: () {
                            _btnanimationController.isActive = true;
                            showGeneralDialog(
                                barrierDismissible: true,
                                barrierLabel: "Sign In",
                                context: context,
                                pageBuilder: (context, _, __) => Center(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .750,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 32, horizontal: 24),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        child: Scaffold(
                                          backgroundColor: Colors.transparent,
                                          body: Column(
                                            children: [
                                              Text(
                                                "Sign In",
                                                style: TextStyle(
                                                    fontSize: 34,
                                                    fontFamily: "Poppins"),
                                              ),
                                              Text(
                                                "Access to 240+ hours of content, Learn desihn and code , by building real apps with flutter",
                                                textAlign: TextAlign.center,
                                              ),
                                              const SignInForm()
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                          btnAnimationController: _btnanimationController,
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
        ],
      ),
    );
  }
}

