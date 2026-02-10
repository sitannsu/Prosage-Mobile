import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class TeachingPlanScreen extends StatelessWidget {
  final String chapterTitle;
  final int day;
  final Color color;

  const TeachingPlanScreen({
    super.key,
    required this.chapterTitle,
    required this.day,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          _buildTeachingPlanNavigator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                           BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
                        ]
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                            child: const Text('3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Addition',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Illustrative Image Placeholder
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(Icons.rocket_launch, color: color.withOpacity(0.2), size: 100),
                        ),
                        Center(
                          child: Image.network(
                            'https://illustrations.popsy.co/amber/home-office.svg',
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Bridge',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '1. Alen is very fond of reading. She has 10 Hindi storybooks, 12 English storybooks and 15 books from the Discovery science series. How many books does she have in all?',
                    style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  _buildSumTable(),
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
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: color),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Text(
                  chapterTitle,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(Icons.add, color: color),
                      onPressed: () {},
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

  Widget _buildTeachingPlanNavigator() {
    return Transform.translate(
      offset: const Offset(0, -25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
               BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
            ],
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.chevron_left, color: color), onPressed: () {}),
              const Text(
                'Teaching Plan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              IconButton(icon: Icon(Icons.chevron_right, color: color), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSumTable() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSumItem('1', '0', 'Hindi Books'),
            _buildSumItem('1', '2', 'English Books'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSumItem('1', '5', 'Science Books'),
            _buildSumItem('3', '7', 'Total Books', isTotal: true),
          ],
        ),
      ],
    );
  }

  Widget _buildSumItem(String t, String o, String label, {bool isTotal = false}) {
    return Column(
      children: [
        Row(
          children: [
            _buildBox(t),
            const SizedBox(width: 4),
            _buildBox(o),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: isTotal ? Colors.black : Colors.grey)),
      ],
    );
  }

  Widget _buildBox(String val) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        color: const Color(0xFFF7F8FA),
      ),
      child: Center(child: Text(val, style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
