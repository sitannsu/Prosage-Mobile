import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams & Results'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              title: Text(exam['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${exam['class']} • ${exam['date']}'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status: ${exam['result_status']}'),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
