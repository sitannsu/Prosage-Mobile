import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  final List<Map<String, dynamic>> exams = const [
    {
      'title': 'Mid-Term Maths Exam',
      'date': '2023-10-15',
      'class': '10-A',
      'result_status': 'Published'
    },
    {
      'title': 'Physics Unit Test 1',
      'date': '2023-11-05',
      'class': '9-B',
      'result_status': 'Pending'
    },
    {
      'title': 'English Final Exam',
      'date': '2023-12-10',
      'class': '12-C',
      'result_status': 'Scheduled'
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Scaffold(
        appBar: AppBar(title: const Text('Exams & Results')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: exams.length,
          itemBuilder: (context, index) => _buildExamCard(context, exams[index]),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Exams & Results')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isDesktop(context) ? 3 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.0,
          ),
          itemCount: exams.length,
          itemBuilder: (context, index) => _buildExamCard(context, exams[index], isGrid: true),
        ),
      );
    }
  }

  Widget _buildExamCard(BuildContext context, Map<String, dynamic> exam, {bool isGrid = false}) {
    Color statusColor = Colors.orange;
    if (exam['result_status'] == 'Published') statusColor = Colors.green;
    if (exam['result_status'] == 'Scheduled') statusColor = Colors.blue;

    return Card(
      margin: isGrid ? EdgeInsets.zero : const EdgeInsets.only(bottom: 16),
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
                    Expanded(
                      child: Text(
                        exam['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        exam['result_status'],
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('${exam['class']} • ${exam['date']}', style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (exam['result_status'] == 'Published')
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('View Results'),
                  )
                else
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Edit Details'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
