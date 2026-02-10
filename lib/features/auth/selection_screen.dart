import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../dashboard/app_scaffold.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildSelectionCard(
                  context,
                  'Student',
                  'You are planning to use our platform as learning?',
                  Icons.school_outlined,
                  const Color(0xFFE0F7FA),
                  const Color(0xFF00BCD4),
                  () {
                    // Navigate to Student Dashboard (Placeholder as Teacher for now)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const AppScaffold()),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSelectionCard(
                  context,
                  'Teacher',
                  'You are planning to use our platform as Teaching?',
                  Icons.school_outlined,
                  const Color(0xFFFFF8E1),
                  const Color(0xFFFFC107),
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const AppScaffold()),
                    );
                  },
                  isSelected: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 220,
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
          ...List.generate(8, (index) {
            final icons = [Icons.school_outlined, Icons.menu_book_outlined, Icons.science_outlined, Icons.calculate_outlined];
            final positions = [
               const Offset(30, 40), const Offset(280, 20), const Offset(60, 110), const Offset(300, 100),
               const Offset(150, 40), const Offset(200, 130), const Offset(40, 150), const Offset(250, 150)
            ];
            return Positioned(
              left: positions[index % 8].dx,
              top: positions[index % 8].dy,
              child: Icon(icons[index % 4], color: Colors.white.withOpacity(0.12), size: 30),
            );
          }),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Who Are You?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Please tell us a little bit more about yourself and who you are.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.whiteEF,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color bgColor,
    Color iconColor,
    VoidCallback onTap, {
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: isSelected ? Border.all(color: AppTheme.primaryColor, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on Colors {
  static const Color whiteEF = Color(0xFFEFEFEF);
}
