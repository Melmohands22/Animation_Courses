import 'package:animation/core/utilis/rive_utils.dart';
import 'package:animation/features/home/presentation/views/widgets/entry_point.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/custom_divider.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/custom_positioned.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/custom_sign_up.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/custom_text_form_field.dart';
import 'package:animation/features/onboarding/presentation/views/widgets/sign_up_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger check;
  late SMITrigger reset;
  late SMITrigger error;
  late SMITrigger confetti;

  void SignIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (_formKey.currentState!.validate()) {
        check.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });

          confetti.fire();
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              Navigator.pushNamed(context, EntryPoint.id);
            });
          });
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .009,
                ),
                Text(
                  "Email",
                  style: TextStyle(color: Colors.black54),
                ),
                CustomEmailTextField(),
                Text(
                  "Password",
                  style: TextStyle(color: Colors.black54),
                ),
                CustomPassTextField(),
                CustomButton(context),
                CustomDivider(),
                SignUpText(),
                CustomSignUp()
              ],
            )),
        isShowLoading
            ? CustomPositioned(
                child: rive.RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: rive.RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard);
                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Padding CustomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          SignIn(context);
        },
        icon: Icon(
          CupertinoIcons.arrow_right,
          color: Color(0xfffe0037),
        ),
        label: Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfff77d8e),
            minimumSize: const Size(double.infinity, 56),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(25),
            ))),
      ),
    );
  }
}
