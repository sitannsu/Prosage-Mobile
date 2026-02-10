import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import 'class_details_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  final List<Map<String, dynamic>> classes = const [
    {'name': 'Class 10-A', 'subject': 'Mathematics', 'students': 45},
    {'name': 'Class 9-B', 'subject': 'Physics', 'students': 40},
    {'name': 'Class 12-C', 'subject': 'Calculus', 'students': 35},
    {'name': 'Class 8-A', 'subject': 'Science', 'students': 50},
    {'name': 'Class 11-A', 'subject': 'Chemistry', 'students': 38},
    {'name': 'Class 9-A', 'subject': 'Biology', 'students': 42},
  ];

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Classes')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: classes.length,
          itemBuilder: (context, index) => _buildClassCard(context, classes[index]),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('My Classes')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isTablet(context) ? 2 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: classes.length,
          itemBuilder: (context, index) => _buildClassCard(context, classes[index]),
        ),
      );
    }
  }

  Widget _buildClassCard(BuildContext context, Map<String, dynamic> cls) {
    return Card(
      margin: Responsive.isMobile(context) ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cls['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cls['subject'],
                        style: const TextStyle(
                          color: AppTheme.secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.people_alt_outlined, size: 20, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('${cls['students']} Students', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClassDetailsScreen(className: cls['name']),
                    ),
                  );
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
