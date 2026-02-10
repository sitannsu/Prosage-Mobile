import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'attendance_screen.dart';
import 'student_list_screen.dart';
import '../assignments/assignments_screen.dart';

class ClassDetailsScreen extends StatelessWidget {
  final String className;
  const ClassDetailsScreen({super.key, required this.className});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(className),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Students"),
              Tab(text: "Attendance"),
              Tab(text: "Assignments"),
            ],
            labelColor: AppTheme.primaryColor,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [
            StudentListScreen(),
            AttendanceScreen(),
            AssignmentsScreen(),
          ],
        ),
      ),
    );
  }
}
