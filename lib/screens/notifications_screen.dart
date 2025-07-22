// File: lib/screens/notifications_screen.dart

import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  // Sample notifications data using local assets
  final List<Map<String, dynamic>> notificationGroups = const [
    {
      'header': 'Today',
      'notifications': [
        {
          'avatarUrl': AssetManager.profileFemale1,
          'username': 'Anna Fitness',
          'content': 'liked your workout post',
          'time': '2m ago',
          'icon': Icons.favorite,
          'iconColor': Colors.red,
          'postImage': AssetManager.workoutDeadlift,
          'type': 'like',
        },
        {
          'avatarUrl': AssetManager.profileMale1,
          'username': 'Coach Mike',
          'content': 'commented: "Great form! Keep it up 💪"',
          'time': '15m ago',
          'icon': Icons.comment,
          'iconColor': Colors.blue,
          'postImage': AssetManager.workoutYoga,
          'type': 'comment',
        },
        {
          'avatarUrl': AssetManager.profile1,
          'username': 'Sarah T.',
          'content': 'started following you',
          'time': '1h ago',
          'icon': Icons.person_add,
          'iconColor': Colors.green,
          'type': 'follow',
        },
        {
          'avatarUrl': AssetManager.workoutCardio,
          'username': 'Fitness Group',
          'content': 'You have a new message in the group',
          'time': '2h ago',
          'icon': Icons.group,
          'iconColor': Colors.purple,
          'type': 'group_message',
        },
      ],
    },
    {
      'header': 'This Week',
      'notifications': [
        {
          'avatarUrl': AssetManager.profile2,
          'username': 'John Trainer',
          'content': 'shared your progress post',
          'time': '1d ago',
          'icon': Icons.share,
          'iconColor': Colors.orange,
          'postImage': AssetManager.progressAfter1,
          'type': 'share',
        },
        {
          'avatarUrl': AssetManager.profileFemale1,
          'username': 'Emma Wilson',
          'content': 'tagged you in a photo',
          'time': '2d ago',
          'icon': Icons.local_offer,
          'iconColor': Colors.indigo,
          'postImage': AssetManager.nutritionMealprep,
          'type': 'tag',
        },
        {
          'avatarUrl': AssetManager.profileMale1,
          'username': 'David Coach',
          'content': 'sent you a workout plan',
          'time': '3d ago',
          'icon': Icons.assignment,
          'iconColor': Colors.teal,
          'type': 'workout_plan',
        },
        {
          'avatarUrl': AssetManager.profile1,
          'username': 'Lisa M.',
          'content': 'liked your meal prep post',
          'time': '4d ago',
          'icon': Icons.favorite,
          'iconColor': Colors.red,
          'postImage': AssetManager.nutritionBowl,
          'type': 'like',
        },
      ],
    },
    {
      'header': 'Earlier',
      'notifications': [
        {
          'avatarUrl': AssetManager.profileMale1,
          'username': 'Fitness App',
          'content': 'Your workout streak is now 15 days! 🔥',
          'time': '1w ago',
          'icon': Icons.emoji_events,
          'iconColor': Colors.amber,
          'type': 'achievement',
        },
        {
          'avatarUrl': AssetManager.profile2,
          'username': 'Tom Fitness',
          'content': 'invited you to join "Morning Runners" group',
          'time': '1w ago',
          'icon': Icons.group_add,
          'iconColor': Colors.blue,
          'type': 'group_invite',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read),
            onPressed: () => _markAllAsRead(context),
            tooltip: 'Mark all as read',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _openNotificationSettings(context),
            tooltip: 'Notification settings',
          ),
        ],
        elevation: 1,
      ),
      body: _buildNotificationsList(),
    );
  }

  Widget _buildNotificationsList() {
    // Check if there are any notifications
    final hasNotifications = notificationGroups.any(
      (group) => (group['notifications'] as List).isNotEmpty,
    );

    if (!hasNotifications) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        // Refresh notifications logic
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: notificationGroups.length,
        itemBuilder: (context, groupIndex) {
          final group = notificationGroups[groupIndex];
          final notifications = group['notifications'] as List;

          if (notifications.isEmpty) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Group Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  group['header']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),

              // Notifications in this group
              ...notifications
                  .map((notification) => _buildNotificationItem(notification))
                  .toList(),

              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: notification['isRead'] == true
            ? Colors.transparent
            : Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(notification['avatarUrl']!),
              radius: 24,
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: notification['iconColor'],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  notification['icon'],
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
        title: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              TextSpan(
                text: notification['username']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' ${notification['content']!}'),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            notification['time']!,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        trailing: _buildNotificationTrailing(notification),
        onTap: () => _onNotificationTap(notification),
      ),
    );
  }

  Widget? _buildNotificationTrailing(Map<String, dynamic> notification) {
    // Show post thumbnail for certain notification types
    if (notification['postImage'] != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          notification['postImage']!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      );
    }

    // Show action buttons for certain types
    switch (notification['type']) {
      case 'follow':
        return SizedBox(
          width: 80,
          child: ElevatedButton(
            onPressed: () => _followBack(notification),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(0, 32),
            ),
            child: const Text('Follow', style: TextStyle(fontSize: 12)),
          ),
        );
      case 'group_invite':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green, size: 20),
              onPressed: () => _acceptInvite(notification),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red, size: 20),
              onPressed: () => _declineInvite(notification),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ],
        );
      default:
        return notification['isRead'] != true
            ? Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              )
            : null;
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetManager.appLogo,
            width: 80,
            height: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 24),
          const Icon(Icons.notifications_none, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            "You're all caught up!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "No new notifications right now.\nKeep sharing your fitness journey!",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _onNotificationTap(Map<String, dynamic> notification) {
    // Handle different notification types
    switch (notification['type']) {
      case 'like':
      case 'comment':
      case 'share':
      case 'tag':
        // Navigate to post detail
        _navigateToPost(notification);
        break;
      case 'follow':
        // Navigate to user profile
        _navigateToProfile(notification);
        break;
      case 'group_message':
      case 'group_invite':
        // Navigate to group
        _navigateToGroup(notification);
        break;
      case 'workout_plan':
        // Navigate to workout plan
        _navigateToWorkoutPlan(notification);
        break;
      case 'achievement':
        // Show achievement detail
        _showAchievementDetail(notification);
        break;
    }
  }

  void _navigateToPost(Map<String, dynamic> notification) {
    // Navigate to post detail screen
    print('Navigate to post: ${notification['postImage']}');
  }

  void _navigateToProfile(Map<String, dynamic> notification) {
    // Navigate to user profile screen
    print('Navigate to profile: ${notification['username']}');
  }

  void _navigateToGroup(Map<String, dynamic> notification) {
    // Navigate to group screen
    print('Navigate to group: ${notification['username']}');
  }

  void _navigateToWorkoutPlan(Map<String, dynamic> notification) {
    // Navigate to workout plan screen
    print('Navigate to workout plan from: ${notification['username']}');
  }

  void _showAchievementDetail(Map<String, dynamic> notification) {
    // Show achievement dialog or screen
    print('Show achievement: ${notification['content']}');
  }

  void _followBack(Map<String, dynamic> notification) {
    // Implement follow back logic
    print('Follow back: ${notification['username']}');
  }

  void _acceptInvite(Map<String, dynamic> notification) {
    // Implement accept invite logic
    print('Accept invite from: ${notification['username']}');
  }

  void _declineInvite(Map<String, dynamic> notification) {
    // Implement decline invite logic
    print('Decline invite from: ${notification['username']}');
  }

  void _markAllAsRead(BuildContext context) {
    // Implement mark all as read logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _openNotificationSettings(BuildContext context) {
    // Navigate to notification settings
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notification Settings'),
        content: const Text('Notification settings will be available soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
