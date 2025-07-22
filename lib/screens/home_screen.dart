// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Title and Icons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // App Logo
                      Image.asset(
                        AssetManager.appLogo,
                        height: 32,
                        width: 32,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.fitness_center, size: 32);
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "FitSocial",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () {
                          // Message action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          // Notification action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Stories Section
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            AssetManager.getProfileImageByIndex(
                              index % AssetManager.profileImages.length,
                            ),
                          ),
                          onBackgroundImageError: (exception, stackTrace) {
                            // Handle image load error
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Story ${index + 1}',
                          style: const TextStyle(fontSize: 12),
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Post Header
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                              AssetManager.getProfileImageByIndex(
                                index % AssetManager.profileImages.length,
                              ),
                            ),
                            onBackgroundImageError: (exception, stackTrace) {
                              // Handle error
                            },
                          ),
                          title: Text(_getTrainerName(index)),
                          subtitle: Text("${2 + index} hours ago"),
                          trailing: const Icon(Icons.more_vert),
                        ),

                        // Post Image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(0),
                            bottom: Radius.circular(0),
                          ),
                          child: Image.asset(
                            AssetManager.getPostImageByIndex(
                              index % AssetManager.allPostImages.length,
                            ),
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 250,
                                color: Colors.grey[300],
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey[600],
                                      ),
                                      Text(
                                        "Image not found",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // Action Buttons
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.comment_outlined),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.share_outlined),
                                onPressed: () {},
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.bookmark_border),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),

                        // Post Content
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${45 + index * 3} likes",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: _getTrainerName(index),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ${_getPostCaption(index)}',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "View all ${12 + index} comments",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
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

  String _getTrainerName(int index) {
    const names = [
      'Coach Mike',
      'Trainer Anna',
      'Fitness Pro',
      'Gym Buddy',
      'Yoga Master',
      'Cardio King',
      'Strength Coach',
      'Nutrition Expert',
      'Personal Trainer',
      'Wellness Guide',
    ];
    return names[index % names.length];
  }

  String _getPostCaption(int index) {
    const captions = [
      'Just crushed today\'s workout! 💪 #StrengthTraining',
      'Morning yoga session complete ✨ #YogaLife',
      'New personal record on deadlifts! 🔥',
      'Healthy meal prep Sunday 🥗 #MealPrep',
      'Cardio day = endorphin day! 🏃‍♂️',
      'Flexibility work paying off 🤸‍♀️',
      'Pushing limits, breaking barriers 💯',
      'Nutrition is 80% of the game 🍎',
      'Consistency beats perfection 📈',
      'Strong mind, strong body 🧠💪',
    ];
    return captions[index % captions.length];
  }
}
