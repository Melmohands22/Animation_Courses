import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          "Sign up with Email , Apple or Google",
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
