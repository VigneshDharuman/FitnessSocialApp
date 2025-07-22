import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  final List<String> trendingTags = const [
    "#HIIT",
    "#Yoga",
    "#FatLoss",
    "#MealPrep",
    "#Cardio",
  ];

  final List<String> recentSearches = const [
    "John Doe",
    "#Transformation",
    "Zumba",
  ];

  final List<Map<String, String>> topCoaches = const [
    {
      "name": "Anna K.",
      "img": "https://randomuser.me/api/portraits/women/1.jpg",
    },
    {"name": "Mike G.", "img": "https://randomuser.me/api/portraits/men/2.jpg"},
  ];

  // FIXED: Replace deprecated Unsplash URLs with placeholder containers
  final List<Map<String, dynamic>> popularPosts = const [
    {"type": "placeholder", "title": "Fitness Workout"},
    {"type": "placeholder", "title": "Yoga Exercise"},
    {"type": "placeholder", "title": "Cardio Training"},
    {"type": "placeholder", "title": "Strength Training"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(context),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Trending",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: trendingTags.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (ctx, i) => Chip(
                  label: Text(trendingTags[i]),
                  backgroundColor: Colors.blue[50],
                ),
              ),
            ),

            // Top Coaches
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Top Coaches",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: topCoaches.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (ctx, i) => Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(topCoaches[i]['img']!),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      topCoaches[i]['name']!,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // Recent searches
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Recent Searches",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: recentSearches.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (ctx, i) =>
                    InputChip(label: Text(recentSearches[i]), onDeleted: () {}),
              ),
            ),

            // Popular posts grid - FIXED: Using placeholder containers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Popular Posts",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: popularPosts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (ctx, i) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue[300]!, Colors.purple[300]!],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.fitness_center, size: 40, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        popularPosts[i]['title']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(right: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search coaches, posts, tags...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.tune),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
