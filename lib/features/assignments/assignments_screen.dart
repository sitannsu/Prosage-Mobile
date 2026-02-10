import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/responsive/responsive.dart';
import 'add_assignment_screen.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

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
      appBar: AppBar(title: const Text('Assignments')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAssignmentScreen()),
          );
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Responsive.isMobile(context)
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: assignments.length,
              itemBuilder: (context, index) => _buildCard(assignments[index]),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isTablet(context) ? 2 : 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2.0,
              ),
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
                        assignment['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        assignment['status'],
                        style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('Due: ${assignment['dueDate']}', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('View'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
