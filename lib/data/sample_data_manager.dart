// Create file: lib/data/sample_data_manager.dart

import '../utils/asset_manager.dart';

class SampleDataManager {
  // ===================
  // USER PROFILES
  // ===================
  static List<Map<String, dynamic>> get sampleUsers => [
    {
      'id': '1',
      'name': 'Coach Mike',
      'username': '@coach_mike',
      'avatar': AssetManager.profileMale1,
      'isCoach': true,
      'isVerified': true,
      'followers': 5240,
      'following': 180,
      'posts': 342,
      'bio':
          'Certified Personal Trainer • 10+ years experience • Transformation Expert 💪',
      'specialty': 'Strength Training',
      'isOnline': true,
    },
    {
      'id': '2',
      'name': 'Anna Fitness',
      'username': '@anna_yoga',
      'avatar': AssetManager.profileFemale1,
      'isCoach': true,
      'isVerified': true,
      'followers': 3180,
      'following': 210,
      'posts': 156,
      'bio':
          'Yoga Instructor • Mindfulness Coach • Finding balance in movement 🧘‍♀️',
      'specialty': 'Yoga & Flexibility',
      'isOnline': true,
    },
    {
      'id': '3',
      'name': 'Sarah Nutrition',
      'username': '@sarah_eats',
      'avatar': AssetManager.profile1,
      'isCoach': true,
      'isVerified': false,
      'followers': 2890,
      'following': 156,
      'posts': 278,
      'bio':
          'Registered Dietitian • Meal Prep Expert • Healthy living made simple 🥗',
      'specialty': 'Nutrition Coaching',
      'isOnline': false,
    },
    {
      'id': '4',
      'name': 'John Trainer',
      'username': '@john_hiit',
      'avatar': AssetManager.profile2,
      'isCoach': true,
      'isVerified': false,
      'followers': 1560,
      'following': 89,
      'posts': 124,
      'bio': 'HIIT Specialist • Cardio Enthusiast • Push your limits! 🔥',
      'specialty': 'HIIT & Cardio',
      'isOnline': false,
    },
  ];

  // ===================
  // SOCIAL POSTS
  // ===================
  static List<Map<String, dynamic>> get samplePosts => [
    {
      'id': 'post_1',
      'userId': '2',
      'username': 'Anna Fitness',
      'userAvatar': AssetManager.profileFemale1,
      'isVerified': true,
      'postImage': AssetManager.workoutYoga,
      'caption':
          'Morning flow complete! 🧘‍♀️ There\'s something magical about starting the day with intentional movement. This 20-minute sequence focused on hip openers and spinal mobility. Who else loves morning yoga? Drop a 🙋‍♀️ if you\'re team AM practice! #YogaFlow #MorningPractice #Mindfulness',
      'timeAgo': '2h',
      'likes': 342,
      'comments': 28,
      'shares': 15,
      'isLiked': false,
      'location': 'Sunrise Studio',
    },
    {
      'id': 'post_2',
      'userId': '1',
      'username': 'Coach Mike',
      'userAvatar': AssetManager.profileMale1,
      'isVerified': true,
      'postImage': AssetManager.workoutDeadlift,
      'caption':
          'Deadlift PR day! 💪 Just hit 405lbs for a clean single. Remember: form > ego always. Your lower back will thank you later. Key points: chest up, shoulders back, drive through heels. Tag someone who needs to see this! #DeadliftPR #StrengthTraining #FormCheck',
      'timeAgo': '4h',
      'likes': 567,
      'comments': 45,
      'shares': 32,
      'isLiked': true,
      'location': 'Iron Paradise Gym',
    },
    {
      'id': 'post_3',
      'userId': '3',
      'username': 'Sarah Nutrition',
      'userAvatar': AssetManager.profile1,
      'isVerified': false,
      'postImage': AssetManager.nutritionMealprep,
      'caption':
          'Sunday meal prep = week of success! 🥗 Prepped 12 balanced meals in 2 hours. Grilled chicken, roasted sweet potato, steamed broccoli, and quinoa. Simple, nutritious, and delicious. What\'s your go-to meal prep combo? Share below! #MealPrepSunday #HealthyEating #NutritionTips',
      'timeAgo': '6h',
      'likes': 234,
      'comments': 56,
      'shares': 78,
      'isLiked': false,
      'location': 'Home Kitchen',
    },
    {
      'id': 'post_4',
      'userId': '4',
      'username': 'John Trainer',
      'userAvatar': AssetManager.profile2,
      'isVerified': false,
      'postImage': AssetManager.workoutCardio,
      'caption':
          '20-minute HIIT session done! 🔥 Today\'s workout: 30s work, 15s rest, 4 rounds. Exercises: Burpees, Mountain climbers, Jump squats, High knees. Heart rate peaked at 185 BPM! Who\'s ready to sweat with me? #HIITWorkout #CardioKiller #NoExcuses',
      'timeAgo': '1d',
      'likes': 189,
      'comments': 23,
      'shares': 12,
      'isLiked': true,
      'location': 'Outdoor Park',
    },
  ];

  // ===================
  // WORKOUT EXERCISES
  // ===================
  static List<Map<String, dynamic>> get sampleExercises => [
    {
      'name': 'Deadlift',
      'category': 'Strength',
      'muscle': 'Full Body',
      'sets': '4',
      'reps': '8-10',
      'weight': '185 lbs',
      'image': AssetManager.workoutDeadlift,
      'instructions':
          'Stand with feet hip-width apart, grip bar with hands just outside legs...',
    },
    {
      'name': 'Bench Press',
      'category': 'Strength',
      'muscle': 'Chest',
      'sets': '4',
      'reps': '8-12',
      'weight': '165 lbs',
      'image': AssetManager.workoutBench,
      'instructions': 'Lie on bench, grip bar slightly wider than shoulders...',
    },
    {
      'name': 'Squats',
      'category': 'Strength',
      'muscle': 'Legs',
      'sets': '3',
      'reps': '12-15',
      'weight': '135 lbs',
      'image': AssetManager.workoutSquats,
      'instructions':
          'Stand with feet shoulder-width apart, lower by bending knees...',
    },
    {
      'name': 'Yoga Flow',
      'category': 'Flexibility',
      'muscle': 'Full Body',
      'sets': '1',
      'reps': '20 min',
      'weight': 'Body weight',
      'image': AssetManager.workoutYoga,
      'instructions':
          'Flow through sun salutations, hold poses for 30 seconds...',
    },
    {
      'name': 'HIIT Cardio',
      'category': 'Cardio',
      'muscle': 'Cardiovascular',
      'sets': '4',
      'reps': '30s work, 15s rest',
      'weight': 'Body weight',
      'image': AssetManager.workoutCardio,
      'instructions':
          'High intensity intervals: burpees, mountain climbers, jump squats...',
    },
  ];

  // ===================
  // NUTRITION MEALS
  // ===================
  static List<Map<String, dynamic>> get sampleMeals => [
    {
      'name': 'Power Breakfast Bowl',
      'category': 'Breakfast',
      'calories': 420,
      'protein': 25,
      'carbs': 45,
      'fat': 18,
      'image': AssetManager.nutritionBowl,
      'ingredients': [
        'Oatmeal',
        'Greek yogurt',
        'Berries',
        'Protein powder',
        'Almonds',
      ],
      'prepTime': '10 min',
    },
    {
      'name': 'Grilled Chicken Meal Prep',
      'category': 'Lunch',
      'calories': 580,
      'protein': 45,
      'carbs': 52,
      'fat': 12,
      'image': AssetManager.nutritionMealprep,
      'ingredients': ['Chicken breast', 'Quinoa', 'Broccoli', 'Sweet potato'],
      'prepTime': '25 min',
    },
    {
      'name': 'Post-Workout Shake',
      'category': 'Snack',
      'calories': 280,
      'protein': 30,
      'carbs': 35,
      'fat': 3,
      'image': AssetManager.nutritionShake,
      'ingredients': ['Protein powder', 'Banana', 'Almond milk', 'Spinach'],
      'prepTime': '5 min',
    },
    {
      'name': 'Mediterranean Salad',
      'category': 'Dinner',
      'calories': 450,
      'protein': 20,
      'carbs': 35,
      'fat': 28,
      'image': AssetManager.nutritionSalad,
      'ingredients': ['Mixed greens', 'Chicken', 'Olives', 'Feta', 'Olive oil'],
      'prepTime': '15 min',
    },
  ];

  // ===================
  // PROGRESS ENTRIES
  // ===================
  static List<Map<String, dynamic>> get sampleProgress => [
    {
      'id': 'progress_1',
      'date': '2025-01-20',
      'weight': 72.5,
      'bodyFat': 12.3,
      'muscle': 58.2,
      'image': AssetManager.progressAfter1,
      'notes':
          'Feeling stronger and more confident. Energy levels are through the roof!',
      'measurements': {
        'chest': 102,
        'waist': 81,
        'hips': 95,
        'bicep': 38,
        'thigh': 58,
      },
    },
    {
      'id': 'progress_2',
      'date': '2025-01-01',
      'weight': 76.2,
      'bodyFat': 16.8,
      'muscle': 55.1,
      'image': AssetManager.progressBefore1,
      'notes':
          'Starting my transformation journey. Ready to commit to the process!',
      'measurements': {
        'chest': 98,
        'waist': 89,
        'hips': 98,
        'bicep': 36,
        'thigh': 61,
      },
    },
  ];

  // ===================
  // ACHIEVEMENTS
  // ===================
  static List<Map<String, dynamic>> get sampleAchievements => [
    {
      'id': 'achieve_1',
      'title': 'Workout Streak',
      'description': '15 days in a row!',
      'icon': Icons.local_fire_department,
      'color': Colors.orange,
      'date': '2025-01-20',
      'progress': 15,
      'target': 30,
    },
    {
      'id': 'achieve_2',
      'title': 'Weight Loss Goal',
      'description': '5kg lost',
      'icon': Icons.trending_down,
      'color': Colors.green,
      'date': '2025-01-18',
      'progress': 5,
      'target': 8,
    },
    {
      'id': 'achieve_3',
      'title': 'Social Butterfly',
      'description': '100 likes received',
      'icon': Icons.favorite,
      'color': Colors.red,
      'date': '2025-01-15',
      'progress': 100,
      'target': 100,
    },
  ];

  // ===================
  // HELPER METHODS
  // ===================

  static Map<String, dynamic>? getUserById(String id) {
    try {
      return sampleUsers.firstWhere((user) => user['id'] == id);
    } catch (e) {
      return null;
    }
  }

  static List<Map<String, dynamic>> getPostsByUserId(String userId) {
    return samplePosts.where((post) => post['userId'] == userId).toList();
  }

  static List<Map<String, dynamic>> getExercisesByCategory(String category) {
    return sampleExercises
        .where(
          (exercise) =>
              exercise['category'].toString().toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();
  }

  static List<Map<String, dynamic>> getMealsByCategory(String category) {
    return sampleMeals
        .where(
          (meal) =>
              meal['category'].toString().toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();
  }

  static Map<String, dynamic> getLatestProgress() {
    return sampleProgress.first;
  }

  static List<Map<String, dynamic>> getActiveAchievements() {
    return sampleAchievements
        .where((achievement) => achievement['progress'] < achievement['target'])
        .toList();
  }

  static List<Map<String, dynamic>> getCompletedAchievements() {
    return sampleAchievements
        .where(
          (achievement) => achievement['progress'] >= achievement['target'],
        )
        .toList();
  }
}
