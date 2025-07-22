#!/bin/bash

# Local Images Setup Script for Fitness Social App
echo "🏋️ Setting up local images for Fitness Social App..."

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

# Step 2: Download placeholder images (you'll need to manually download the actual images)
echo "📥 Creating placeholder files..."

# Profile placeholders
touch assets/images/profiles/profile_1.jpg
touch assets/images/profiles/profile_2.jpg
touch assets/images/profiles/profile_female_1.jpg
touch assets/images/profiles/profile_male_1.jpg
touch assets/images/profiles/default_profile.png

# Workout post placeholders
touch assets/images/posts/workout_deadlift.jpg
touch assets/images/posts/workout_bench.jpg
touch assets/images/posts/workout_squats.jpg
touch assets/images/posts/workout_dumbbells.jpg
touch assets/images/posts/workout_cardio.jpg
touch assets/images/posts/workout_yoga.jpg
touch assets/images/posts/workout_pushups.jpg
touch assets/images/posts/workout_stretching.jpg

# Nutrition post placeholders
touch assets/images/posts/nutrition_mealprep.jpg
touch assets/images/posts/nutrition_bowl.jpg
touch assets/images/posts/nutrition_shake.jpg
touch assets/images/posts/nutrition_salad.jpg

# Progress photo placeholders
touch assets/images/progress/progress_before_1.jpg
touch assets/images/progress/progress_after_1.jpg
touch assets/images/progress/progress_before_2.jpg
touch assets/images/progress/progress_after_2.jpg

# Branding placeholders
touch assets/images/branding/app_logo.png
touch assets/images/branding/splash_background.jpg

# Coach profile placeholders
touch assets/images/coaches/coach_mike.jpg
touch assets/images/coaches/coach_anna.jpg
touch assets/images/coaches/coach_john.jpg

echo "✅ Asset structure created!"
echo "📝 Remember to:"
echo "   1. Download actual images and replace placeholders"
echo "   2. Run 'flutter pub get' after updating pubspec.yaml"
echo "   3. Test on different devices"

# Step 3: Run Flutter commands
echo "🔧 Running Flutter setup..."
flutter clean
flutter pub get

echo "🎉 Setup complete! Now replace placeholder files with actual images."