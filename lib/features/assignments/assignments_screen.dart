import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'assignment_subjects_screen.dart';
import 'assignment_list_view.dart'; // We'll move old assignments list here

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildOptionCard(
                    context,
                    '1. Create Assignment?',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices, nisl id dictum.',
                    'https://illustrations.popsy.co/blue/customer-support.svg',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AssignmentSubjectsScreen())),
                  ),
                  const SizedBox(height: 32),
                  _buildOptionCard(
                    context,
                    '2. View Assignment',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices, nisl id dictum.',
                    'https://illustrations.popsy.co/blue/work-from-home.svg',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AssignmentListView())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppTheme.primaryColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Text(
                    'Assignment',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(width: 48), // Spacer for balance
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, String title, String subtitle, String imageUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
          ]
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.4),
            ),
            const SizedBox(height: 24),
            Image.network(imageUrl, height: 140),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.search, color: AppTheme.primaryColor, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}
