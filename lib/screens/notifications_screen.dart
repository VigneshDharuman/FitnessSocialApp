import 'package:flutter/material.dart';
import '../models/notification_models.dart';
import '../widgets/notification_item_widget.dart';
import '../widgets/empty_notifications.dart';

// Dummy data for demonstration
final List<NotificationGroup> notifications = [
  NotificationGroup(
    header: "Today",
    items: [
      NotificationItem(
        avatarUrl: "https://randomuser.me/api/portraits/women/1.jpg",
        username: "Anna",
        content: "liked your post",
        time: "2m ago",
        icon: Icons.favorite,
        onTap: () {},
      ),
      NotificationItem(
        avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
        username: "Coach Mike",
        content: "commented: Great job!",
        time: "10m ago",
        icon: Icons.comment,
        onTap: () {},
      ),
    ],
  ),
  NotificationGroup(
    header: "This Week",
    items: [
      NotificationItem(
        avatarUrl: "https://randomuser.me/api/portraits/men/3.jpg",
        username: "John",
        content: "started following you",
        time: "2d ago",
        icon: Icons.person_add,
        onTap: () {},
      ),
    ],
  ),
];

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {}, // Settings logic
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const EmptyNotifications()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, groupIndex) {
                final group = notifications[groupIndex];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.header,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    ...group.items.map((item) => NotificationItemWidget(item)),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
    );
  }
}
