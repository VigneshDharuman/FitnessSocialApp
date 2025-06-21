import 'package:flutter/material.dart';
import '../data/sample_messages.dart'; // import your sample data

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // TODO: Implement new chat
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Refresh messages
        },
        child: ListView.separated(
          itemCount: messages.length,
          separatorBuilder: (context, index) => Divider(height: 0),
          itemBuilder: (context, index) {
            final msg = messages[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(msg.avatarUrl),
                radius: 28,
              ),
              title: Text(
                msg.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                msg.lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    msg.time,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  if (msg.unreadCount > 0)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${msg.unreadCount}',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
              onTap: () {
                // TODO: Navigate to chat detail
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: New message
        },
        child: Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
