import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    super.key,
    required this.course,
  });
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
          color: course.bgColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  course.dic,
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}



class Course {
  final String dic, title, iconSrc;
  final Color bgColor;

  Course(
      {this.dic = "Build and Animate an ios app from scratch",
      required this.title,
      this.iconSrc = "assets/icons/ios.svg",
      this.bgColor = const Color(0xff7553f4)});
}

List<Course> Courses = [
  Course(title: "Animations in SwiftUi"),
  Course(
    title: "Animations in Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: Color(0xff80a4ff),
  ),
];
List<Course> recentCourses = [
  Course(title: "State Machine"),
  Course(
    title: "Animated Menu",
    iconSrc: "assets/icons/code.svg",
    bgColor: Color(0xff9cc5ff),
  ),
  Course(title: "Flutter with Rive"),
  Course(
    title: "Animated Menu",
    iconSrc: "assets/icons/code.svg",
    bgColor: Color(0xff9cc5ff),
  ),
];
