// File: lib/screens/messages_screen.dart

import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  // Sample messages data using local assets
  final List<Map<String, dynamic>> messages = const [
    {
      'name': 'Coach Mike',
      'lastMessage': 'Great job on today\'s workout! Keep it up 💪',
      'avatarUrl': AssetManager.profileMale1,
      'time': '2m',
      'unreadCount': 2,
      'isOnline': true,
      'isCoach': true,
    },
    {
      'name': 'Anna Fitness',
      'lastMessage': 'Thanks for the nutrition tips! 🙏',
      'avatarUrl': AssetManager.profileFemale1,
      'time': '15m',
      'unreadCount': 1,
      'isOnline': true,
      'isCoach': false,
    },
    {
      'name': 'Fitness Group',
      'lastMessage': 'John: Anyone up for a morning run?',
      'avatarUrl': AssetManager.workoutCardio,
      'time': '1h',
      'unreadCount': 3,
      'isOnline': false,
      'isGroup': true,
    },
    {
      'name': 'Sarah T.',
      'lastMessage': 'Sent a photo',
      'avatarUrl': AssetManager.profile1,
      'time': '2h',
      'unreadCount': 0,
      'isOnline': false,
      'isCoach': false,
    },
    {
      'name': 'David Nutrition',
      'lastMessage': 'Your meal plan is ready for review',
      'avatarUrl': AssetManager.profile2,
      'time': '3h',
      'unreadCount': 1,
      'isOnline': true,
      'isCoach': true,
    },
    {
      'name': 'Yoga Masters',
      'lastMessage': 'Emma: New class schedule posted!',
      'avatarUrl': AssetManager.workoutYoga,
      'time': '1d',
      'unreadCount': 0,
      'isOnline': false,
      'isGroup': true,
    },
    {
      'name': 'Tom Trainer',
      'lastMessage': 'See you at the gym tomorrow!',
      'avatarUrl': AssetManager.profileMale1,
      'time': '2d',
      'unreadCount': 0,
      'isOnline': false,
      'isCoach': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.add_comment_rounded),
            onPressed: () {},
          ),
        ],
        elevation: 1,
      ),
      body: Column(
        children: [
          // Active/Online users horizontal scroll
          _buildActiveUsers(),

          // Messages list
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Refresh messages logic
                await Future.delayed(const Duration(seconds: 1));
              },
              child: messages.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      itemCount: messages.length,
                      separatorBuilder: (context, index) =>
                          Divider(height: 1, color: Colors.grey[200]),
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        return _buildMessageTile(context, msg);
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
        tooltip: 'New Message',
      ),
    );
  }

  Widget _buildActiveUsers() {
    final activeUsers = messages
        .where((msg) => msg['isOnline'] == true && msg['isGroup'] != true)
        .toList();

    if (activeUsers.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Active Now',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activeUsers.length,
              itemBuilder: (context, index) {
                final user = activeUsers[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 8,
                    right: index == activeUsers.length - 1 ? 16 : 0,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                user['avatarUrl']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 24,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 2,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user['name']!.split(' ')[0], // First name only
                        style: const TextStyle(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(BuildContext context, Map<String, dynamic> msg) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Stack(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: ClipOval(
              child: Image.asset(
                msg['avatarUrl']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32,
                  );
                },
              ),
            ),
          ),
          if (msg['isOnline'] == true)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          if (msg['isCoach'] == true)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              msg['name']!,
              style: TextStyle(
                fontWeight: msg['unreadCount'] > 0
                    ? FontWeight.bold
                    : FontWeight.w600,
              ),
            ),
          ),
          if (msg['isGroup'] == true)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Group',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
        ],
      ),
      subtitle: Text(
        msg['lastMessage']!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: msg['unreadCount'] > 0 ? Colors.black87 : Colors.grey[600],
          fontWeight: msg['unreadCount'] > 0
              ? FontWeight.w500
              : FontWeight.normal,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            msg['time']!,
            style: TextStyle(
              fontSize: 12,
              color: msg['unreadCount'] > 0 ? Colors.blue : Colors.grey,
              fontWeight: msg['unreadCount'] > 0
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
          if (msg['unreadCount'] > 0) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                '${msg['unreadCount']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
      onTap: () {
        // Navigate to chat detail screen
        _openChatDetail(context, msg);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetManager.thriveSpaceLogo,
            width: 80,
            height: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 24),
          const Text(
            'No messages yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start a conversation with your\nfitness community!',
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_comment),
            label: const Text('Start Chatting'),
          ),
        ],
      ),
    );
  }

  void _openChatDetail(BuildContext context, Map<String, dynamic> msg) {
    // Navigate to individual chat screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(
          userName: msg['name']!,
          userAvatar: msg['avatarUrl']!,
          isOnline: msg['isOnline'] ?? false,
          isCoach: msg['isCoach'] ?? false,
        ),
      ),
    );
  }
}

// Simple chat detail screen
class ChatDetailScreen extends StatelessWidget {
  final String userName;
  final String userAvatar;
  final bool isOnline;
  final bool isCoach;

  const ChatDetailScreen({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.isOnline,
    required this.isCoach,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(userAvatar),
                ),
                if (isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName, style: const TextStyle(fontSize: 16)),
                Text(
                  isOnline ? 'Online' : 'Last seen recently',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Chat with $userName',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.add), onPressed: () {}),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
