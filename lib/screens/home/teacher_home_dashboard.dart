import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../classes/my_classes_screen.dart';
import '../assignments/assignments_screen.dart';
import '../classes/attendance_screen.dart';
import '../exams/exams_screen.dart';
// import '../messages/messages_screen.dart'; // Future scope

class TeacherHomeDashboard extends StatelessWidget {
  const TeacherHomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Section
            const Text(
              'Hello, Ms. Sharma 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Here is your daily summary.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Summary Cards
            Row(
              children: [
                _buildSummaryCard('Classes', '5', Icons.class_outlined, Colors.blue),
                const SizedBox(width: 12),
                _buildSummaryCard('Students', '180', Icons.people_outline, Colors.orange),
                const SizedBox(width: 12),
                _buildSummaryCard('Present', '92%', Icons.check_circle_outline, Colors.green),
              ],
            ),
            const SizedBox(height: 30),

            // Grid Menu
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3,
              children: [
                _buildMenuCard(
                  context,
                  'My Classes',
                  Icons.class_,
                  AppTheme.primaryColor,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyClassesScreen())),
                ),
                _buildMenuCard(
                  context,
                  'Assignments',
                  Icons.assignment,
                  Colors.deepPurple,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AssignmentsScreen())),
                ),
                _buildMenuCard(
                  context,
                  'Attendance',
                  Icons.playlist_add_check,
                  Colors.teal,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AttendanceScreen())),
                ),
                _buildMenuCard(
                  context,
                  'Exams',
                  Icons.note_alt,
                  Colors.redAccent,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamsScreen())),
                ),
                _buildMenuCard(
                  context,
                  'Messages',
                  Icons.message,
                  Colors.amber,
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Messages Feature Coming Soon!')));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
