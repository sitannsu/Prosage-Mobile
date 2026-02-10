import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  final List<Map<String, dynamic>> students = const [
    {'name': 'Rohan Kumar', 'roll': '101', 'status': 'Present', 'avatar': 'https://i.pravatar.cc/150?u=1'},
    {'name': 'Sanya Gupta', 'roll': '102', 'status': 'Absent', 'avatar': 'https://i.pravatar.cc/150?u=2'},
    {'name': 'Amit Patel', 'roll': '103', 'status': 'Present', 'avatar': 'https://i.pravatar.cc/150?u=3'},
    {'name': 'Priya Singh', 'roll': '104', 'status': 'Late', 'avatar': 'https://i.pravatar.cc/150?u=4'},
    {'name': 'Vikram Mehra', 'roll': '105', 'status': 'Present', 'avatar': 'https://i.pravatar.cc/150?u=5'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        Color statusColor = Colors.green;
        if (student['status'] == 'Absent') statusColor = Colors.red;
        if (student['status'] == 'Late') statusColor = Colors.orange;

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(student['avatar']),
            backgroundColor: Colors.grey[200],
          ),
          title: Text(student['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Roll No: ${student['roll']}'),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              student['status'],
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
