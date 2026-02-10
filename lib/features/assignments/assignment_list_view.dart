import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AssignmentListView extends StatelessWidget {
  const AssignmentListView({super.key});

  final List<Map<String, dynamic>> assignments = const [
    {
      'title': 'Mathematics Homework 1',
      'dueDate': '2023-11-20',
      'status': 'Pending',
    },
    {
      'title': 'Science Project',
      'dueDate': '2023-11-25',
      'status': 'Submitted',
    },
    {
      'title': 'English Essay',
      'dueDate': '2023-11-28',
      'status': 'Graded',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('View Assignments'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assignments.length,
        itemBuilder: (context, index) => _buildCard(assignments[index]),
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> assignment) {
    Color statusColor = Colors.orange;
    if (assignment['status'] == 'Submitted') statusColor = Colors.blue;
    if (assignment['status'] == 'Graded') statusColor = Colors.green;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(assignment['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: Text(assignment['status'], style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text('Due: ${assignment['dueDate']}', style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('View Details')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
