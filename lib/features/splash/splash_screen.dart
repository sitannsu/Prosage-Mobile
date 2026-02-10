import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: Stack(
          children: [
            // Large circular background shapes
            Positioned(
              top: -100,
              right: -100,
              child: _buildCircle(300),
            ),
            Positioned(
              bottom: -50,
              left: -100,
              child: _buildCircle(250),
            ),
            Positioned(
              top: 200,
              left: -50,
              child: _buildCircle(150),
            ),
            // Pattern of educational icons
            ...List.generate(12, (index) {
              final icons = [
                Icons.school_outlined, Icons.menu_book_outlined, Icons.science_outlined, 
                Icons.calculate_outlined, Icons.emoji_events_outlined, Icons.lightbulb_outline,
                Icons.palette_outlined, Icons.history_edu_outlined, Icons.psychology_outlined,
                Icons.biotech_outlined, Icons.architecture, Icons.auto_stories_outlined
              ];
              final positions = [
                const Offset(40, 60), const Offset(280, 40), const Offset(60, 200),
                const Offset(310, 220), const Offset(150, 100), const Offset(220, 350),
                const Offset(50, 450), const Offset(280, 500), const Offset(100, 600),
                const Offset(250, 650), const Offset(40, 750), const Offset(200, 780)
              ];
              return Positioned(
                left: positions[index].dx,
                top: positions[index].dy,
                child: Transform.rotate(
                  angle: index % 2 == 0 ? 0.2 : -0.2,
                  child: Icon(icons[index % icons.length], color: Colors.white.withOpacity(0.08), size: 35),
                ),
              );
            }),
            // Horizontal Center Logo
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(
                    Icons.gesture, // Placeholder for the abstract logo
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'PROSAGE',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4,
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

  Widget _buildCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.05),
      ),
    );
  }
}
