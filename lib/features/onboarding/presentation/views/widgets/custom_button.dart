import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: ElevatedButton.icon(
        onPressed: () {
         
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
