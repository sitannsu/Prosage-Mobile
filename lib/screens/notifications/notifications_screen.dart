import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      'title': 'New Exam Schedule',
      'message': 'The mid-term exam schedule has been updated.',
      'time': '2 hrs ago',
      'icon': Icons.calendar_today,
      'isUnread': true,
    },
    {
      'title': 'Assignment Submitted',
      'message': 'Rohan Kumar submitted "Maths Homework".',
      'time': '5 hrs ago',
      'icon': Icons.assignment_turned_in,
      'isUnread': false,
    },
    {
      'title': 'Meeting Reminder',
      'message': 'Staff meeting at 3:00 PM today.',
      'time': '1 day ago',
      'icon': Icons.meeting_room,
      'isUnread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(
            color: notification['isUnread'] ? AppTheme.primaryColor.withOpacity(0.05) : Colors.transparent,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                child: Icon(notification['icon'], color: AppTheme.primaryColor),
              ),
              title: Text(
                notification['title'],
                style: TextStyle(
                  fontWeight: notification['isUnread'] ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(notification['message']),
                  const SizedBox(height: 4),
                  Text(notification['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
