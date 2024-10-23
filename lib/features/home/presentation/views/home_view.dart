import 'package:animation/features/home/presentation/views/widgets/courses_card.dart';
import 'package:animation/features/home/presentation/views/widgets/secandry_course_card.dart';
import 'package:animation/features/home/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * (1 / 20),
                ),
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

