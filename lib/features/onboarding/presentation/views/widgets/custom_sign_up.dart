import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSignUp extends StatelessWidget {
  const CustomSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}