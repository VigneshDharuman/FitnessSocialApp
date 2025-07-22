#!/bin/bash
# Image Download Script for Fitness Social App
# Run this from your project root directory

# Create directories
mkdir -p assets/images/profiles
mkdir -p assets/images/posts
mkdir -p assets/images/progress
mkdir -p assets/images/stories
mkdir -p assets/images/branding
mkdir -p assets/images/coaches
mkdir -p assets/icons
mkdir -p assets/placeholders

echo "📁 Directories created successfully!"

# Download profile images
echo "👤 Downloading profile images..."
curl -o assets/images/profiles/default_profile.png "https://ui-avatars.com/api/?name=User&background=007BFF&color=fff&size=150"
curl -o assets/images/profiles/profile_1.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=150&h=150&fit=crop&crop=face"
curl -o assets/images/profiles/profile_2.jpg "https://images.unsplash.com/photo-1594381898411-846e7d193883?w=150&h=150&fit=crop&crop=face"
curl -o assets/images/profiles/profile_female_1.jpg "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face"
curl -o assets/images/profiles/profile_male_1.jpg "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face"

# Download workout images
echo "💪 Downloading workout images..."
curl -o assets/images/posts/workout_deadlift.jpg "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400&h=400&fit=crop"
curl -o assets/images/posts/workout_bench.jpg "https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?w=400&h=400&fit=crop"
curl -o assets/images/posts/workout_squats.jpg "https://images.unsplash.com/photo-1566241440091-ec10de8db2e1?w=400&h=400&fit=crop"
curl -o assets/images/posts/workout_yoga.jpg "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&h=400&fit=crop"
curl -o assets/images/posts/workout_cardio.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=400&fit=crop"

# Download nutrition images
echo "🥗 Downloading nutrition images..."
curl -o assets/images/posts/nutrition_mealprep.jpg "https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=400&h=400&fit=crop"
curl -o assets/images/posts/nutrition_bowl.jpg "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=400&fit=crop"
curl -o assets/images/posts/nutrition_shake.jpg "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=400&h=400&fit=crop"

# Download branding images
echo "🎨 Downloading branding images..."
curl -o assets/images/branding/app_logo.png "https://via.placeholder.com/512x512/007BFF/FFFFFF?text=FIT"
curl -o assets/images/branding/splash_background.jpg "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=1080&h=1920&fit=crop"

# Create placeholder images for missing ones
echo "📋 Creating placeholders..."
curl -o assets/images/placeholders/post_placeholder.png "https://via.placeholder.com/400x400/E0E0E0/808080?text=Post"
curl -o assets/images/placeholders/profile_placeholder.png "https://via.placeholder.com/150x150/007BFF/FFFFFF?text=User"

echo "✅ All images downloaded successfully!"
echo "📊 Total files: $(find assets -type f | wc -l)"

# Make script executable: chmod +x download_images.sh
# Run with: ./download_images.sh