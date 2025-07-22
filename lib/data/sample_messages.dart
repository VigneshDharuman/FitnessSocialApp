// lib/data/sample_messages.dart
import '../models/message.dart';
import '../utils/asset_manager.dart';

final List<Message> messages = [
  Message(
    name: "Coach Mike",
    lastMessage: "Great workout today! Keep it up 💪",
    avatarUrl: AssetManager.coachMike,
    time: "2m",
    unreadCount: 2,
  ),
  Message(
    name: "Anna K.",
    lastMessage: "Sent a workout video",
    avatarUrl: AssetManager.coachAnna,
    time: "5m",
    unreadCount: 1,
  ),
  Message(
    name: "John Fitness",
    lastMessage: "See you at the gym tomorrow!",
    avatarUrl: AssetManager.coachJohn,
    time: "1h",
    unreadCount: 0,
  ),
  Message(
    name: "Sarah P.",
    lastMessage: "How's your meal prep going?",
    avatarUrl: AssetManager.profileFemale1,
    time: "2h",
    unreadCount: 3,
  ),
  Message(
    name: "David L.",
    lastMessage: "Thanks for the workout tips!",
    avatarUrl: AssetManager.profileMale1,
    time: "3h",
    unreadCount: 0,
  ),
];

// lib/data/sample_posts.dart
class SamplePost {
  final String authorName;
  final String authorAvatar;
  final String postImage;
  final String caption;
  final String timeAgo;
  final int likes;
  final int comments;

  SamplePost({
    required this.authorName,
    required this.authorAvatar,
    required this.postImage,
    required this.caption,
    required this.timeAgo,
    required this.likes,
    required this.comments,
  });
}

final List<SamplePost> samplePosts = [
  SamplePost(
    authorName: "Coach Mike",
    authorAvatar: AssetManager.coachMike,
    postImage: AssetManager.workoutDeadlift,
    caption: "Deadlift form check! Remember to keep your back straight 💪",
    timeAgo: "2h",
    likes: 124,
    comments: 18,
  ),
  SamplePost(
    authorName: "Anna K.",
    authorAvatar: AssetManager.coachAnna,
    postImage: AssetManager.workoutYoga,
    caption: "Morning yoga flow to start the day right ✨ #YogaLife",
    timeAgo: "4h",
    likes: 89,
    comments: 12,
  ),
  SamplePost(
    authorName: "John Fitness",
    authorAvatar: AssetManager.coachJohn,
    postImage: AssetManager.nutritionMealprep,
    caption: "Sunday meal prep session! Consistency is key 🥗",
    timeAgo: "6h",
    likes: 156,
    comments: 24,
  ),
  SamplePost(
    authorName: "Sarah P.",
    authorAvatar: AssetManager.profileFemale1,
    postImage: AssetManager.workoutCardio,
    caption: "30 minutes of cardio done! Feeling energized 🏃‍♀️",
    timeAgo: "8h",
    likes: 67,
    comments: 8,
  ),
  SamplePost(
    authorName: "David L.",
    authorAvatar: AssetManager.profileMale1,
    postImage: AssetManager.workoutBench,
    caption: "New bench press PR! Hard work pays off 🔥",
    timeAgo: "10h",
    likes: 203,
    comments: 31,
  ),
];

// lib/data/sample_coaches.dart
class SampleCoach {
  final String name;
  final String avatar;
  final String specialty;
  final double rating;
  final int clients;

  SampleCoach({
    required this.name,
    required this.avatar,
    required this.specialty,
    required this.rating,
    required this.clients,
  });
}

final List<SampleCoach> sampleCoaches = [
  SampleCoach(
    name: "Coach Mike",
    avatar: AssetManager.coachMike,
    specialty: "Strength Training",
    rating: 4.9,
    clients: 150,
  ),
  SampleCoach(
    name: "Anna K.",
    avatar: AssetManager.coachAnna,
    specialty: "Yoga & Flexibility",
    rating: 4.8,
    clients: 89,
  ),
  SampleCoach(
    name: "John Fitness",
    avatar: AssetManager.coachJohn,
    specialty: "Nutrition & Wellness",
    rating: 4.7,
    clients: 203,
  ),
];

// lib/data/sample_progress.dart
class ProgressPhoto {
  final String imagePath;
  final String date;
  final String description;
  final String type; // 'before' or 'after'

  ProgressPhoto({
    required this.imagePath,
    required this.date,
    required this.description,
    required this.type,
  });
}

final List<ProgressPhoto> sampleProgressPhotos = [
  ProgressPhoto(
    imagePath: AssetManager.progressBefore1,
    date: "2024-01-01",
    description: "Starting my fitness journey",
    type: "before",
  ),
  ProgressPhoto(
    imagePath: AssetManager.progressAfter1,
    date: "2024-06-01",
    description: "5 months of consistency!",
    type: "after",
  ),
  ProgressPhoto(
    imagePath: AssetManager.progressBefore2,
    date: "2024-06-15",
    description: "New goals, new challenges",
    type: "before",
  ),
  ProgressPhoto(
    imagePath: AssetManager.progressAfter2,
    date: "2024-12-01",
    description: "6 months later - transformation complete!",
    type: "after",
  ),
];
