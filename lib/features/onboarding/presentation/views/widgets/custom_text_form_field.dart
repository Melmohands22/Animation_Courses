import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPassTextField extends StatelessWidget {
  const CustomPassTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        onSaved: (password) {},
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
    );
  }
}

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        onSaved: (email) {},
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
    );
  }
}

