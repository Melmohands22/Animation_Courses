import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Courses",
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}