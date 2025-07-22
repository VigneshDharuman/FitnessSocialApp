// File: lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final bool isOwnProfile = true;
  final bool isCoach = true;

  // Sample posts using local images
  final List<String> userPosts = const [
    AssetManager.workoutYoga,
    AssetManager.workoutCardio,
    AssetManager.nutritionMealprep,
    AssetManager.workoutDeadlift,
    AssetManager.nutritionBowl,
    AssetManager.workoutSquats,
    AssetManager.nutritionShake,
    AssetManager.workoutBench,
    AssetManager.workoutStretching,
    AssetManager.nutritionSalad,
    AssetManager.workoutDumbbells,
    AssetManager.workoutPushups,
  ];

  // Progress photos
  final List<Map<String, String>> progressPhotos = const [
    {"image": AssetManager.progressBefore1, "label": "Week 1"},
    {"image": AssetManager.progressAfter1, "label": "Week 8"},
    {"image": AssetManager.progressBefore1, "label": "Week 12"},
    {"image": AssetManager.progressAfter1, "label": "Week 16"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(),

            // Highlights Section
            _buildHighlights(),

            // Tabs Section
            _buildTabSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(AssetManager.profileMale1),
                  ),
                  if (isCoach)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 20),

              // Stats and Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Certified Fitness Coach\nTransformation Expert 💪',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 12),

                    // Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStat('Posts', '120'),
                        _buildStat('Followers', '5.2k'),
                        _buildStat('Following', '180'),
                        if (isCoach) _buildStat('Clients', '14'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Action Buttons
          if (isOwnProfile)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add),
                    label: const Text('Follow'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                    label: const Text('Message'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  Widget _buildHighlights() {
    final highlights = [
      {'title': 'Transform', 'image': AssetManager.progressBefore1},
      {'title': 'Workouts', 'image': AssetManager.workoutDeadlift},
      {'title': 'Nutrition', 'image': AssetManager.nutritionMealprep},
      {'title': 'Tips', 'image': AssetManager.workoutYoga},
    ];

    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: highlights.length,
        itemBuilder: (context, i) => Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(highlights[i]['image']!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 4),
            Text(highlights[i]['title']!, style: const TextStyle(fontSize: 12)),
          ],
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
      ),
    );
  }

  Widget _buildTabSection() {
    return DefaultTabController(
      length: isCoach ? 3 : 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              const Tab(icon: Icon(Icons.grid_on), text: 'Posts'),
              const Tab(icon: Icon(Icons.timeline), text: 'Progress'),
              if (isCoach) const Tab(icon: Icon(Icons.group), text: 'Clients'),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                _buildPostsGrid(),
                _buildProgressTab(),
                if (isCoach) _buildClientsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: userPosts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(userPosts[index], fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildProgressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Transformation Journey',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: progressPhotos.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) => Column(
                children: [
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        progressPhotos[i]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    progressPhotos[i]['label']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Text(
                  'Current Stats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('Weight', '72kg'),
                    _buildStatCard('Body Fat', '12%'),
                    _buildStatCard('Muscle', '65kg'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_a_photo),
            label: const Text('Add Progress Photo'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  Widget _buildClientsTab() {
    final clients = [
      {
        'name': 'Sarah M.',
        'progress': '8/12 weeks',
        'avatar': AssetManager.profileFemale1,
      },
      {
        'name': 'Mike R.',
        'progress': '4/16 weeks',
        'avatar': AssetManager.profileMale1,
      },
      {
        'name': 'Emma T.',
        'progress': '12/12 weeks',
        'avatar': AssetManager.profile1,
      },
      {
        'name': 'David K.',
        'progress': '6/10 weeks',
        'avatar': AssetManager.profile2,
      },
      {
        'name': 'Lisa P.',
        'progress': '2/8 weeks',
        'avatar': AssetManager.profileFemale1,
      },
      {
        'name': 'Alex J.',
        'progress': '10/12 weeks',
        'avatar': AssetManager.profileMale1,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: clients.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(clients[i]['avatar']!),
          ),
          title: Text(clients[i]['name']!),
          subtitle: Text('Progress: ${clients[i]['progress']!}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.message, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
