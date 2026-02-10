import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import '../assignments/assignments_screen.dart';
import '../classes/attendance_screen.dart';

class TeacherHomeDashboard extends StatelessWidget {
  const TeacherHomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCurvedHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  _buildAsymmetricalFirstRow(context),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionCard(
                          context,
                          'Assignment',
                          Icons.edit_note,
                          Colors.blue[600]!,
                          const Color(0xFFE8F0FE),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const AssignmentsScreen()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionCard(
                          context,
                          'Attendance',
                          Icons.calendar_today,
                          Colors.pink[600]!,
                          const Color(0xFFFDE8EF),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const AttendanceScreen()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildAllMenuButton(context),
                  const SizedBox(height: 100), // Bottom padding
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurvedHeader(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.85)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          // Background Icons pattern
          ...List.generate(6, (index) {
            final icons = [Icons.school_outlined, Icons.menu_book_outlined, Icons.science_outlined, Icons.calculate_outlined, Icons.architecture, Icons.palette_outlined];
            final positions = [
               const Offset(20, 40), const Offset(280, 30), const Offset(50, 110), const Offset(320, 130), const Offset(150, 60), const Offset(220, 150)
            ];
            return Positioned(
              left: positions[index].dx,
              top: positions[index].dy,
              child: Icon(icons[index], color: Colors.white.withOpacity(0.12), size: 30),
            );
          }),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Hi, Priya', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(height: 4),
                          Text('How are you doing today?', style: TextStyle(fontSize: 14, color: Colors.white70)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.add, color: AppTheme.primaryColor, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(27.5),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey, size: 26),
                        const SizedBox(width: 15),
                        Text('Search...', style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                      ],
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

  Widget _buildAsymmetricalFirstRow(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: _buildActionCard(
                    context,
                    'Books',
                    Icons.book, 
                    Colors.white,
                    const Color(0xFFFFCE00), 
                    () {},
                    iconInsideContainer: true,
                    topLogo: true,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _buildActionCard(
                    context,
                    'Teach',
                    Icons.calculate,
                    Colors.white,
                    const Color(0xFFFF7A00), 
                    () {},
                    iconInsideContainer: true,
                    topLogo: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFCE00),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Center(
                      child: Icon(Icons.person, size: 150, color: Colors.white.withOpacity(0.3)), 
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(Icons.star, color: Colors.white38, size: 30),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color iconColor,
    Color bgColor,
    VoidCallback onTap, {
    bool iconInsideContainer = false,
    bool topLogo = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (topLogo) ...[
               Align(
                 alignment: Alignment.topLeft,
                 child: Container(
                   padding: const EdgeInsets.all(8),
                   decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                   child: Icon(icon, color: bgColor == const Color(0xFFFFCE00) ? Colors.pink : bgColor, size: 24),
                 ),
               ),
               const Spacer(),
               Text(
                 title,
                 style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
               ),
            ] else ...[
               Center(
                 child: Container(
                   padding: const EdgeInsets.all(15),
                   decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                   child: Icon(icon, color: iconColor, size: 32),
                 ),
               ),
               const SizedBox(height: 15),
               Text(
                 title,
                 textAlign: TextAlign.center,
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kBlackDE),
               ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAllMenuButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Text('All Menu', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Spacer(),
          Icon(Icons.chevron_right, color: Colors.white54, size: 30),
          Icon(Icons.chevron_right, color: Colors.white70, size: 30),
          Icon(Icons.chevron_right, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}

const Color kBlackDE = Color(0xFF333333);
