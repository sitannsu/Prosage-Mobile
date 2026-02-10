import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'ONLINE',
      'subtitle': 'LEARNING WITH FUN',
      'image': 'illustration_1',
    },
    {
      'title': 'TRAINING',
      'subtitle': 'BY TEACHER',
      'image': 'illustration_2',
    },
    {
      'title': 'CHALLENGE',
      'subtitle': 'WITH YOUR CLASSMATES',
      'image': 'illustration_3',
    },
  ];

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemBuilder: (context, index) => _buildPageContent(index),
              ),
            ),
            _buildDots(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    final data = _onboardingData[index];
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Spacer(),
          // Illustration Placeholder
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                index == 0 ? Icons.online_prediction : (index == 1 ? Icons.school : Icons.groups),
                size: 200,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            data['title']!,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFCE00), // Yellow color from mock
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data['subtitle']!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          _buildGetStartedButton(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: 250,
      height: 60,
      child: ElevatedButton(
        onPressed: _navigateToLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFCE00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingData.length,
        (index) => Container(
          height: 8,
          width: _currentPage == index ? 40 : 10,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentPage == index ? Colors.black : Colors.black12,
          ),
        ),
      ),
    );
  }
}
