import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCurvedHeader(context),
            const SizedBox(height: 20),
            _buildProfileInfo(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileCard(
                    'Logout',
                    Icons.logout,
                    const Color(0xFFFFCE00).withOpacity(0.2),
                    const Color(0xFFFFCE00),
                    () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildProfileCard(
                    'Change Password',
                    Icons.lock_person_outlined,
                    const Color(0xFFFF7A00).withOpacity(0.2),
                    const Color(0xFFFF7A00),
                    () {},
                  ),
                  const SizedBox(height: 16),
                  _buildProfileCard(
                    'Edit Profile',
                    Icons.edit_outlined,
                    const Color(0xFFE8F0FE),
                    const Color(0xFF4285F4),
                    () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // Bottom padding for nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildCurvedHeader(BuildContext context) {
    return Container(
      height: 200,
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
               const Offset(20, 60), const Offset(280, 40), const Offset(50, 130), const Offset(320, 150), const Offset(150, 80), const Offset(220, 170)
            ];
            return Positioned(
              left: positions[index].dx,
              top: positions[index].dy,
              child: Icon(icons[index], color: Colors.white.withOpacity(0.12), size: 30),
            );
          }),
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
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'My Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.orange.withOpacity(0.2), width: 2),
          ),
          child: const CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('https://i.pravatar.cc/300?img=12'),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Gulab Chand Tejvani',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Crystal School, Jamnagar Highway',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCard(
    String title,
    IconData icon,
    Color iconBgColor,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
