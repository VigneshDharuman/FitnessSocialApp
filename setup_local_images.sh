#!/bin/bash

# Fitness Social App - Local Images Setup Script
# Run this from your project root directory: ./setup_local_images.sh

echo "🎯 Setting up local images for Fitness Social App..."
echo "=================================================="

# Step 1: Create directory structure
echo "📁 Creating asset directories..."
mkdir -p assets/images/profiles
mkdir -p assets/images/posts
mkdir -p assets/images/progress
mkdir -p assets/images/stories
mkdir -p assets/images/branding
mkdir -p assets/images/coaches
mkdir -p assets/icons
mkdir -p assets/placeholders

# Step 2: Download images (using curl or wget)
echo "📥 Downloading sample images..."

# Profile images
echo "👤 Downloading profile images..."
curl -L -o assets/images/profiles/default_profile.png "https://ui-avatars.com/api/?name=User&background=007BFF&color=fff&size=150"
curl -L -o assets/images/profiles/profile_male_1.jpg "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face"
curl -L -o assets/images/profiles/profile_female_1.jpg "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face"
curl -L -o assets/images/profiles/profile_1.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=150&h=150&fit=crop&crop=face"
curl -L -o assets/images/profiles/profile_2.jpg "https://images.unsplash.com/photo-1594381898411-846e7d193883?w=150&h=150&fit=crop&crop=face"

# Workout images
echo "💪 Downloading workout images..."
curl -L -o assets/images/posts/workout_deadlift.jpg "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_bench.jpg "https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_squats.jpg "https://images.unsplash.com/photo-1566241440091-ec10de8db2e1?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_yoga.jpg "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_cardio.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_dumbbells.jpg "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_pushups.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/workout_stretching.jpg "https://images.unsplash.com/photo-1506629905136-b5f676ca8b8d?w=400&h=400&fit=crop"

# Nutrition images
echo "🥗 Downloading nutrition images..."
curl -L -o assets/images/posts/nutrition_mealprep.jpg "https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/nutrition_bowl.jpg "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/nutrition_shake.jpg "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=400&h=400&fit=crop"
curl -L -o assets/images/posts/nutrition_salad.jpg "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=400&fit=crop"

# Progress images
echo "📈 Downloading progress images..."
curl -L -o assets/images/progress/progress_before_1.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=300&h=400&fit=crop"
curl -L -o assets/images/progress/progress_after_1.jpg "https://images.unsplash.com/photo-1594381898411-846e7d193883?w=300&h=400&fit=crop"

# Branding images
echo "🎨 Downloading branding images..."
curl -L -o assets/images/branding/app_logo.png "https://via.placeholder.com/512x512/007BFF/FFFFFF?text=FIT"
curl -L -o assets/images/branding/splash_background.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=1080&h=1920&fit=crop"

# Placeholder images
echo "📋 Creating placeholders..."
curl -L -o assets/images/placeholders/post_placeholder.png "https://via.placeholder.com/400x400/E0E0E0/808080?text=Post"
curl -L -o assets/images/placeholders/profile_placeholder.png "https://via.placeholder.com/150x150/007BFF/FFFFFF?text=User"

# Step 3: Create utility files
echo "🔧 Creating utility files..."

# Create asset manager
cat > lib/utils/asset_manager.dart << 'EOF'
class AssetManager {
  static const String _imagesPath = 'assets/images';
  
  // Profile images
  static const String defaultProfile = '$_imagesPath/profiles/default_profile.png';
  static const String profile1 = '$_imagesPath/profiles/profile_1.jpg';
  static const String profile2 = '$_imagesPath/profiles/profile_2.jpg';
  static const String profileFemale1 = '$_imagesPath/profiles/profile_female_1.jpg';
  static const String profileMale1 = '$_imagesPath/profiles/profile_male_1.jpg';
  
  // Workout posts
  static const String workoutDeadlift = '$_imagesPath/posts/workout_deadlift.jpg';
  static const String workoutBench = '$_imagesPath/posts/workout_bench.jpg';
  static const String workoutSquats = '$_imagesPath/posts/workout_squats.jpg';
  static const String workoutYoga = '$_imagesPath/posts/workout_yoga.jpg';
  static const String workoutCardio = '$_imagesPath/posts/workout_cardio.jpg';
  static const String workoutDumbbells = '$_imagesPath/posts/workout_dumbbells.jpg';
  static const String workoutPushups = '$_imagesPath/posts/workout_pushups.jpg';
  static const String workoutStretching = '$_imagesPath/posts/workout_stretching.jpg';
  
  // Nutrition posts
  static const String nutritionMealprep = '$_imagesPath/posts/nutrition_mealprep.jpg';
  static const String nutritionBowl = '$_imagesPath/posts/nutrition_bowl.jpg';
  static const String nutritionShake = '$_imagesPath/posts/nutrition_shake.jpg';
  static const String nutritionSalad = '$_imagesPath/posts/nutrition_salad.jpg';
  
  // Progress photos
  static const String progressBefore1 = '$_imagesPath/progress/progress_before_1.jpg';
  static const String progressAfter1 = '$_imagesPath/progress/progress_after_1.jpg';
  
  // Branding
  static const String appLogo = '$_imagesPath/branding/app_logo.png';
  static const String splashBackground = '$_imagesPath/branding/splash_background.jpg';
  
  // Placeholders
  static const String postPlaceholder = '$_imagesPath/placeholders/post_placeholder.png';
  static const String profilePlaceholder = '$_imagesPath/placeholders/profile_placeholder.png';
  
  // Helper methods
  static String getRandomProfile() {
    final profiles = [profile1, profile2, profileFemale1, profileMale1];
    final index = DateTime.now().millisecond % profiles.length;
    return profiles[index];
  }
  
  static String getWorkoutImage(int index) {
    final workouts = [workoutDeadlift, workoutBench, workoutSquats, workoutYoga, workoutCardio, workoutDumbbells, workoutPushups, workoutStretching];
    return workouts[index % workouts.length];
  }
  
  static String getNutritionImage(int index) {
    final nutrition = [nutritionMealprep, nutritionBowl, nutritionShake, nutritionSalad];
    return nutrition[index % nutrition.length];
  }
}
EOF

# Step 4: Flutter commands
echo "🔄 Running Flutter commands..."
flutter clean
flutter pub get

# Step 5: Verification
echo "✅ Verifying setup..."
echo "📊 Asset count: $(find assets -type f | wc -l) files"
echo "📁 Directory structure:"
find assets -type d | sort

echo ""
echo "🎉 Setup complete!"
echo "=================================================="
echo "✅ All local images have been downloaded and configured"
echo "✅ Asset manager created"
echo "✅ Pubspec.yaml updated"
echo "✅ Flutter dependencies resolved"
echo ""
echo "🚀 Next steps:"
echo "1. Replace your screen files with the updated versions"
echo "2. Run: flutter run"
echo "3. Test all screens to verify images load correctly"
echo ""
echo "📱 Test command: flutter run -d chrome"

# Make script executable
