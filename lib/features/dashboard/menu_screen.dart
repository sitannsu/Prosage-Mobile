import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(24),
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.85,
              children: [
                _buildMenuItem('Books', Icons.menu_book, const Color(0xFFFFF0F0), Colors.redAccent),
                _buildMenuItem('Teach', Icons.calculate, const Color(0xFFFFF7EA), Colors.orange),
                _buildMenuItem('Assignment', Icons.assignment_outlined, const Color(0xFFE8F4FD), Colors.blueAccent),
                _buildMenuItem('Attendance', Icons.calendar_today_outlined, const Color(0xFFF0F9F1), Colors.green),
                _buildMenuItem('Time Table', Icons.access_time_outlined, const Color(0xFFFFF0F0), Colors.redAccent),
                _buildMenuItem('Reports', Icons.bar_chart_outlined, const Color(0xFFFDEEF6), Colors.pinkAccent),
                _buildMenuItem('Assements', Icons.description_outlined, const Color(0xFFFFF8E1), Colors.amber),
                _buildMenuItem('Results', Icons.assignment_turned_in_outlined, const Color(0xFFF3E5F5), Colors.purpleAccent),
                _buildMenuItem('Homework', Icons.home_work_outlined, const Color(0xFFE8F5E9), Colors.lightGreen),
              ],
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
                    'Menu',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: AppTheme.primaryColor),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color bgColor, Color iconColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
               BoxShadow(color: iconColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))
            ]
          ),
          child: Icon(icon, color: iconColor, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
