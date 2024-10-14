import 'package:animation/features/home/presentation/views/widgets/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TitleSection(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...Courses.map((course) => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CourseCard(course: course),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Recent",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                ...recentCourses.map(
                  (Course) => Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20.0, bottom: 20),
                    child: SecondaryCourseCard(course: Course),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

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
