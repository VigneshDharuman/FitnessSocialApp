// File: lib/screens/search_screen.dart

import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  final List<String> trendingTags = const [
    "#HIIT",
    "#Yoga",
    "#FatLoss",
    "#MealPrep",
    "#Cardio",
    "#Strength",
    "#Flexibility",
    "#Nutrition",
  ];

  final List<String> recentSearches = const [
    "Anna Fitness",
    "#Transformation",
    "Coach Mike",
    "Yoga poses",
  ];

  // Top coaches with local images
  final List<Map<String, String>> topCoaches = const [
    {
      "name": "Anna K.",
      "specialty": "Yoga & Flexibility",
      "img": AssetManager.profileFemale1,
    },
    {
      "name": "Mike G.",
      "specialty": "Strength Training",
      "img": AssetManager.profileMale1,
    },
    {
      "name": "Sarah T.",
      "specialty": "Nutrition Coach",
      "img": AssetManager.profile1,
    },
    {
      "name": "John D.",
      "specialty": "HIIT & Cardio",
      "img": AssetManager.profile2,
    },
  ];

  // Popular posts with local images
  final List<Map<String, String>> popularPosts = const [
    {"img": AssetManager.workoutYoga, "title": "Yoga Session"},
    {"img": AssetManager.workoutDeadlift, "title": "Strength Training"},
    {"img": AssetManager.nutritionMealprep, "title": "Meal Prep"},
    {"img": AssetManager.workoutCardio, "title": "Cardio Workout"},
    {"img": AssetManager.nutritionBowl, "title": "Healthy Bowl"},
    {"img": AssetManager.workoutSquats, "title": "Leg Day"},
    {"img": AssetManager.nutritionShake, "title": "Protein Shake"},
    {"img": AssetManager.workoutBench, "title": "Chest Day"},
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
            // Trending Section
            _buildSection(
              title: "Trending",
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingTags.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (ctx, i) => Chip(
                    label: Text(trendingTags[i]),
                    backgroundColor: Colors.blue[50],
                    labelStyle: TextStyle(color: Colors.blue[700]),
                  ),
                ),
              ),
            ),

            // Top Coaches Section
            _buildSection(
              title: "Top Coaches",
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: topCoaches.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (ctx, i) => _buildCoachCard(topCoaches[i]),
                ),
              ),
            ),

            // Recent Searches Section
            _buildSection(
              title: "Recent Searches",
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: recentSearches.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (ctx, i) => InputChip(
                    label: Text(recentSearches[i]),
                    onDeleted: () {},
                    deleteIconColor: Colors.grey[600],
                  ),
                ),
              ),
            ),

            // Popular Posts Grid
            _buildSection(
              title: "Popular Posts",
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: popularPosts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemBuilder: (ctx, i) => _buildPostCard(popularPosts[i]),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        child,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCoachCard(Map<String, String> coach) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(coach['img']!),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          coach['name']!,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        Text(
          coach['specialty']!,
          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPostCard(Map<String, String> post) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(post['img']!, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                post['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 18,
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
          prefixIcon: const Icon(Icons.search, size: 20),
          suffixIcon: const Icon(Icons.tune, size: 20),
          filled: true,
          fillColor: Colors.grey[100],
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
