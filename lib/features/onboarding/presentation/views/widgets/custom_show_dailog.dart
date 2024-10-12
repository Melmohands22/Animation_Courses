import 'package:animation/features/onboarding/presentation/views/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

Future<Object?> CustomShowDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .800,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),
                    Text(
                      "Access to 240+ hours of content, Learn design and code by building real apps with Flutter",
                      textAlign: TextAlign.center,
                    ),
                    const SignInForm(),
                  ],
                ),
                Positioned(
                  bottom: -54,
                  left: (MediaQuery.of(context).size.width - 110) / 2,
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
