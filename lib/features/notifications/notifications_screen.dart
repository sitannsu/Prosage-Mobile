import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';

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
    {
      'title': 'System Update',
      'message': 'App maintenance scheduled for Sunday.',
      'time': '2 days ago',
      'icon': Icons.system_update,
      'isUnread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) => _buildNotificationItem(context, notifications[index]),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isDesktop(context) ? 3 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3.5,
          ),
          itemCount: notifications.length,
          itemBuilder: (context, index) => Card(
            child: Center(
              child: _buildNotificationItem(context, notifications[index], isGrid: true),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildNotificationItem(BuildContext context, Map<String, dynamic> notification, {bool isGrid = false}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: notification['isUnread'] ? AppTheme.primaryColor.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
        child: Icon(
          notification['icon'],
          color: notification['isUnread'] ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
      title: Text(
        notification['title'],
        style: TextStyle(
          fontWeight: notification['isUnread'] ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Text(notification['message'], maxLines: isGrid ? 1 : 2, overflow: TextOverflow.ellipsis),
           if (!isGrid) ...[
            const SizedBox(height: 4),
            Text(notification['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ],
      ),
      trailing: isGrid ? Text(notification['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)) : null,
      onTap: () {},
    );
  }
}
