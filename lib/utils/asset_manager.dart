// lib/utils/asset_manager.dart
class AssetManager {
  // Base paths
  static const String _profilesPath = 'assets/images/profiles/';
  static const String _postsPath = 'assets/images/posts/';
  static const String _progressPath = 'assets/images/progress/';
  static const String _brandingPath = 'assets/images/branding/';
  static const String _coachesPath = 'assets/images/coaches/';
  static const String _placeholdersPath = 'assets/placeholders/';

  // Profile Images
  static const String defaultProfile = '${_profilesPath}default_profile.png';
  static const String profile1 = '${_profilesPath}profile_1.jpg';
  static const String profile2 = '${_profilesPath}profile_2.jpg';
  static const String profileFemale1 = '${_profilesPath}profile_female_1.jpg';
  static const String profileMale1 = '${_profilesPath}profile_male_1.jpg';

  // Workout Post Images
  static const String workoutDeadlift = '${_postsPath}workout_deadlift.jpg';
  static const String workoutBench = '${_postsPath}workout_bench.jpg';
  static const String workoutSquats = '${_postsPath}workout_squats.jpg';
  static const String workoutDumbbells = '${_postsPath}workout_dumbbells.jpg';
  static const String workoutCardio = '${_postsPath}workout_cardio.jpg';
  static const String workoutYoga = '${_postsPath}workout_yoga.jpg';
  static const String workoutPushups = '${_postsPath}workout_pushups.jpg';
  static const String workoutStretching = '${_postsPath}workout_stretching.jpg';

  // Nutrition Post Images
  static const String nutritionMealprep = '${_postsPath}nutrition_mealprep.jpg';
  static const String nutritionBowl = '${_postsPath}nutrition_bowl.jpg';
  static const String nutritionShake = '${_postsPath}nutrition_shake.jpg';
  static const String nutritionSalad = '${_postsPath}nutrition_salad.jpg';

  // Progress Photos
  static const String progressBefore1 = '${_progressPath}progress_before_1.jpg';
  static const String progressAfter1 = '${_progressPath}progress_after_1.jpg';
  static const String progressBefore2 = '${_progressPath}progress_before_2.jpg';
  static const String progressAfter2 = '${_progressPath}progress_after_2.jpg';

  // Branding Assets
  static const String appLogo = '${_brandingPath}app_logo.png';
  static const String splashBackground =
      '${_brandingPath}splash_background.jpg';

  // Coach Profiles
  static const String coachMike = '${_coachesPath}coach_mike.jpg';
  static const String coachAnna = '${_coachesPath}coach_anna.jpg';
  static const String coachJohn = '${_coachesPath}coach_john.jpg';

  // Helper Lists for easy access
  static const List<String> profileImages = [
    profile1,
    profile2,
    profileFemale1,
    profileMale1,
  ];

  static const List<String> workoutImages = [
    workoutDeadlift,
    workoutBench,
    workoutSquats,
    workoutDumbbells,
    workoutCardio,
    workoutYoga,
    workoutPushups,
    workoutStretching,
  ];

  static const List<String> nutritionImages = [
    nutritionMealprep,
    nutritionBowl,
    nutritionShake,
    nutritionSalad,
  ];

  static const List<String> progressImages = [
    progressBefore1,
    progressAfter1,
    progressBefore2,
    progressAfter2,
  ];

  static const List<String> coachImages = [coachMike, coachAnna, coachJohn];

  // Combined post images (workout + nutrition)
  static const List<String> allPostImages = [
    ...workoutImages,
    ...nutritionImages,
  ];

  // Helper methods
  static String getRandomProfileImage() {
    return profileImages[(DateTime.now().millisecondsSinceEpoch) %
        profileImages.length];
  }

  static String getRandomPostImage() {
    return allPostImages[(DateTime.now().millisecondsSinceEpoch) %
        allPostImages.length];
  }

  static String getRandomCoachImage() {
    return coachImages[(DateTime.now().millisecondsSinceEpoch) %
        coachImages.length];
  }

  static String getRandomWorkoutImage() {
    return workoutImages[(DateTime.now().millisecondsSinceEpoch) %
        workoutImages.length];
  }

  static String getRandomNutritionImage() {
    return nutritionImages[(DateTime.now().millisecondsSinceEpoch) %
        nutritionImages.length];
  }

  static String getProfileImageByIndex(int index) {
    if (index < 0 || index >= profileImages.length) {
      return defaultProfile;
    }
    return profileImages[index];
  }

  static String getPostImageByIndex(int index) {
    if (index < 0 || index >= allPostImages.length) {
      return workoutImages[0]; // Default to first workout image
    }
    return allPostImages[index];
  }
}
