import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Replace with real data test
  final bool isOwnProfile = true;
  final bool isCoach = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture, Name, Bio
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Pic
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(
                      'assets/images/profile.jpg',
                    ), // Replace with NetworkImage for real user
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Certified Fitness Coach. Transformation Expert.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            _buildStat('Posts', '120'),
                            _buildStat('Followers', '5.2k'),
                            _buildStat('Following', '180'),
                            if (isCoach) _buildStat('Clients', '14'),
                          ],
                        ),
                        SizedBox(height: 16),
                        if (isOwnProfile)
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('Edit Profile'),
                          )
                        else ...[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Follow'),
                          ),
                          SizedBox(width: 8),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('Message'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Highlights Section
            _buildHighlights(),

            // Tabs: Posts | Progress | (Coach: Clients/Programs)
            DefaultTabController(
              length: isCoach ? 3 : 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on), text: 'Posts'),
                      Tab(icon: Icon(Icons.timeline), text: 'Progress'),
                      if (isCoach)
                        Tab(icon: Icon(Icons.group), text: 'Clients'),
                    ],
                  ),
                  SizedBox(
                    height: 450,
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
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Build Stats
  Widget _buildStat(String label, String count) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }

  // Highlights Widget (dummy)
  Widget _buildHighlights() {
    final highlights = ['Transform', 'Tips', 'Meals'];
    return Container(
      height: 72,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: highlights.length,
        itemBuilder: (context, i) => Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue[200],
              child: Icon(Icons.star, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(highlights[i], style: TextStyle(fontSize: 13)),
          ],
        ),
        separatorBuilder: (_, __) => SizedBox(width: 12),
      ),
    );
  }

  // Posts Grid (dummy)
  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.grey[300],
        child: Icon(Icons.image, size: 40, color: Colors.grey[600]),
      ),
    );
  }

  // Progress Tab (dummy)
  Widget _buildProgressTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Progress Photos',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (_, __) => SizedBox(width: 10),
              itemBuilder: (context, i) => Container(
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/progress${i + 1}.jpg',
                    ), // Dummy images
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Weight: 72kg   |   Body Fat: 12%',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Update Progress'),
          ),
        ],
      ),
    );
  }

  // Clients Tab for Coach (dummy)
  Widget _buildClientsTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(child: Text('C${i + 1}')),
        title: Text('Client ${i + 1}'),
        subtitle: Text('Progress: 4/12 weeks'),
        trailing: Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {},
      ),
    );
  }
}
