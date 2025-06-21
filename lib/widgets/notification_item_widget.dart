import 'package:flutter/material.dart';
import '../models/notification_models.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationItem item;
  const NotificationItemWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.avatarUrl),
        radius: 24,
      ),
      title: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: item.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' ${item.content}'),
          ],
        ),
      ),
      subtitle: Text(
        item.time,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: Icon(item.icon, color: Colors.blue),
      onTap: item.onTap,
    );
  }
}
