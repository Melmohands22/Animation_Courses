import 'package:animation/features/onboarding/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
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
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset("assets/icons/email.svg"),
              ),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        Text(
          "Password",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset("assets/icons/password.svg"),
              ),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        CustomButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "OR",
                style: TextStyle(color: Colors.black26),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              "Sign up with Email , Apple or Google",
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/email_box.svg",
                  height: 62,
                  width: 62,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/apple_box.svg",
                  height: 62,
                  width: 62,
                )),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/google_box.svg",
                  height: 62,
                  width: 62,
                )),
          ],
        )
      ],
    ));
  }
}
