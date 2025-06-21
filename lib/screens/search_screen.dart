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

  final List<Map<String, String>> popularPosts = const [
    {"img": "https://source.unsplash.com/400x400/?fitness,workout"},
    {"img": "https://source.unsplash.com/400x400/?yoga,exercise"},
    // Add more posts as needed
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

            // Popular posts grid
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
              itemBuilder: (ctx, i) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  popularPosts[i]['img']!,
                  fit: BoxFit.cover,
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
