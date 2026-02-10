import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import '../assignments/assignments_screen.dart';
import '../classes/attendance_screen.dart';
import 'books_screen.dart';
import 'menu_screen.dart';
import 'teach_screen.dart';

class TeacherHomeDashboard extends StatelessWidget {
  const TeacherHomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Image.network(
                'https://www.transparenttextures.com/patterns/cubes.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCurvedHeader(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildAsymmetricalFirstRow(context),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: _buildActionCard(
                              context,
                              'Assignment',
                              Icons.edit_note,
                              Colors.blue[600]!,
                              const Color(0xFFE8F4FD),
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const AssignmentsScreen()),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildActionCard(
                              context,
                              'Attendance',
                              Icons.calendar_today_outlined,
                              const Color(0xFFF46565),
                              const Color(0xFFFFF0F0),
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
        ],
      ),
    );
  }

  Widget _buildCurvedHeader(BuildContext context) {
    return Container(
      height: 240,
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
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
                          Text('Hi, Priya', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(height: 4),
                          Text('How are you doing today?', style: TextStyle(fontSize: 14, color: Colors.whiteA7, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.add, color: AppTheme.primaryColor, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                         BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))
                      ]
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Icon(Icons.search, color: Colors.grey, size: 28),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey[200],
                        ),
                        IconButton(
                          icon: const Icon(Icons.tune, color: AppTheme.primaryColor),
                          onPressed: () {},
                        ),
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
      height: 320,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: _buildMainActionCard(
                    'Books',
                    Icons.menu_book,
                    const Color(0xFFFFCE00),
                    const Color(0xFFF46565),
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BooksScreen())),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: _buildMainActionCard(
                    'Teach',
                    Icons.calculate,
                    const Color(0xFFFF7A00),
                    Colors.white,
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TeachScreen())),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: _buildCharacterCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainActionCard(String title, IconData icon, Color bgColor, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFCE00),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 20,
            right: 20,
            child: Icon(Icons.star, color: Colors.white54, size: 35),
          ),
          Center(
            child: Transform.translate(
              offset: const Offset(0, 30),
              child: Opacity(
                opacity: 0.9,
                child: Image.network(
                  'https://illustrations.popsy.co/amber/teacher.svg', // A better illustrative placeholder
                  width: 180,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => 
                     const Icon(Icons.person, size: 180, color: Colors.white70),
                ),
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
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllMenuButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen())),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: const [
            Text('All Menu', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            Spacer(),
            Icon(Icons.chevron_right, color: Colors.white54, size: 24),
            Icon(Icons.chevron_right, color: Colors.white70, size: 24),
            Icon(Icons.chevron_right, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}

extension on Colors {
  static const Color whiteA7 = Color(0xFFA7A7A7);
}
