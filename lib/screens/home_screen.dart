import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';
import '../widgets/thrive_space_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with App Branding
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 70, 12),
              child: Row(
                children: [
                  // ThriveSpace Logo
                  const ThriveSpaceLogo(
                    size: 40,
                    primaryColor: Color(0xFF22c55e),
                    secondaryColor: Color(0xFF0891b2),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ThriveSpace',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0a0a0a),
                        ),
                      ),
                      Text(
                        'Your wellness journey awaits',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Stories Section  
            Container(
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF6B35), Color(0xFFEC4899)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(
                                AssetManager.getProfileImageByIndex(
                                  index % AssetManager.profileImages.length,
                                ),
                              ),
                              onBackgroundImageError: (exception, stackTrace) {
                                // Handle image load error
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _getStoryName(index),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF64748b),
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Feed Section
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Post Header
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  AssetManager.getProfileImageByIndex(
                                    index % AssetManager.profileImages.length,
                                  ),
                                ),
                                onBackgroundImageError: (exception, stackTrace) {
                                  // Handle error
                                },
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _getTrainerName(index),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF0a0a0a),
                                          ),
                                        ),
                                        if (index % 3 == 0) ...[
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.verified,
                                            color: Color(0xFF5f41c4),
                                            size: 14,
                                          ),
                                        ],
                                      ],
                                    ),
                                    Text(
                                      "${2 + index} hours ago",
                                      style: const TextStyle(
                                        color: Color(0xFF64748b),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Color(0xFF64748b),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),

                        // Post Content Text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            _getPostCaption(index),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0a0a0a),
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Post Image
                        if (index % 2 == 0)
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: Image.asset(
                                AssetManager.getPostImageByIndex(
                                  index % AssetManager.allPostImages.length,
                                ),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image_outlined,
                                            size: 40,
                                            color: Colors.grey[400],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Image not found",
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                        // Action Buttons and Stats
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _buildActionButton(
                                    icon: Icons.favorite_border,
                                    activeIcon: Icons.favorite,
                                    isActive: index % 4 == 0,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 16),
                                  _buildActionButton(
                                    icon: Icons.chat_bubble_outline,
                                    activeIcon: Icons.chat_bubble,
                                    isActive: false,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 16),
                                  _buildActionButton(
                                    icon: Icons.share_outlined,
                                    activeIcon: Icons.share,
                                    isActive: false,
                                    onPressed: () {},
                                  ),
                                  const Spacer(),
                                  _buildActionButton(
                                    icon: Icons.bookmark_border,
                                    activeIcon: Icons.bookmark,
                                    isActive: index % 5 == 0,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "${127 + index * 13} likes",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color(0xFF0a0a0a),
                                    ),
                                  ),
                                  const Text(
                                    " • ",
                                    style: TextStyle(
                                      color: Color(0xFF64748b),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${23 + index} comments",
                                    style: const TextStyle(
                                      color: Color(0xFF64748b),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required IconData activeIcon,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        isActive ? activeIcon : icon,
        color: isActive ? const Color(0xFFFF6B35) : const Color(0xFF64748b),
        size: 22,
      ),
    );
  }

  String _getStoryName(int index) {
    const names = [
      'Sarah',
      'Mike',
      'Emma',
      'Alex',
      'Lisa',
      'Jake',
      'Anna',
      'Ryan',
    ];
    return names[index % names.length];
  }

  String _getTrainerName(int index) {
    const names = [
      'Sarah Johnson',
      'Mike Chen',
      'Emma Rodriguez',
      'Alex Thompson',
      'Lisa Park',
      'Jake Williams',
      'Anna Davis',
      'Ryan Martinez',
      'Coach Maria',
      'Trainer David',
    ];
    return names[index % names.length];
  }

  String _getPostCaption(int index) {
    const captions = [
      'Just finished an amazing morning yoga session! 🧘‍♀️ The mind-body connection is incredible when you\'re fully present. Remember: progress over perfection, always!',
      'Hit a new personal record on deadlifts today! 💪 6 months of consistent training paying off. Who else is crushing their fitness goals this week?',
      'Sunday meal prep complete! 🥗 Prepping these colorful Buddha bowls for the week ahead. Nutrition is truly 80% of the fitness journey.',
      'Cardio session done! 🏃‍♂️ Nothing beats those endorphins after a good run. Your body can do it, your mind just needs to believe.',
      'Flexibility and mobility work is just as important as strength training! 🤸‍♀️ Taking time to stretch and recover properly.',
      'Pushing limits and breaking barriers every single day 💯 Consistency beats perfection every time. Keep showing up for yourself!',
      'Post-workout glow is real! ✨ Just wrapped up an intense HIIT session. Feeling strong and energized for the day ahead.',
      'Transform your mindset, transform your body 🧠💪 Mental strength is the foundation of physical strength. You\'ve got this!',
      'Community workout session was amazing! 👥 Training with like-minded people makes everything better. We\'re stronger together!',
      'Recovery day essentials: hydration, nutrition, and rest 💧 Taking care of your body is not selfish, it\'s essential.',
    ];
    return captions[index % captions.length];
  }
}
