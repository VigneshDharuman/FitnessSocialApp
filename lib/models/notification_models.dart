import 'package:flutter/material.dart';

class NotificationItem {
  final String avatarUrl;
  final String username;
  final String content;
  final String time;
  final IconData icon;
  final VoidCallback? onTap;

  NotificationItem({
    required this.avatarUrl,
    required this.username,
    required this.content,
    required this.time,
    required this.icon,
    this.onTap,
  });
}

class NotificationGroup {
  final String header; // E.g. "Today", "This Week"
  final List<NotificationItem> items;

  NotificationGroup({required this.header, required this.items});
}
