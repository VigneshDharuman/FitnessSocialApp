import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Learn',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0a0a0a),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Expand your knowledge with expert guidance',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF64748b),
                ),
              ),
              const SizedBox(height: 24),
              
              // Featured Articles Section
              const Text(
                'Featured Articles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0a0a0a),
                ),
              ),
              const SizedBox(height: 16),
              
              _buildArticleCard(
                'Nutrition Basics: Building a Sustainable Diet',
                'Learn the fundamentals of nutrition and how to create meal plans that work for your lifestyle.',
                'Dr. Sarah Mitchell',
                '12 min read',
                Icons.restaurant_menu,
              ),
              const SizedBox(height: 12),
              
              _buildArticleCard(
                'The Science of Strength Training',
                'Understand the principles behind effective strength training and progressive overload.',
                'Coach Mike Thompson',
                '8 min read',
                Icons.fitness_center,
              ),
              const SizedBox(height: 12),
              
              _buildArticleCard(
                'Mental Health and Fitness Connection',
                'Explore the powerful relationship between physical activity and mental well-being.',
                'Dr. Emma Rodriguez',
                '15 min read',
                Icons.psychology,
              ),
              
              const SizedBox(height: 32),
              
              // Quick Tips Section
              const Text(
                'Quick Tips',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0a0a0a),
                ),
              ),
              const SizedBox(height: 16),
              
              _buildTipCard(
                'Stay Hydrated',
                'Drink water before, during, and after workouts to maintain peak performance.',
                Icons.water_drop,
                const Color(0xFF3b82f6),
              ),
              const SizedBox(height: 12),
              
              _buildTipCard(
                'Listen to Your Body',
                'Rest days are just as important as workout days for muscle recovery and growth.',
                Icons.favorite,
                const Color(0xFFec4899),
              ),
              const SizedBox(height: 12),
              
              _buildTipCard(
                'Form Over Weight',
                'Perfect your technique before increasing weight to prevent injuries.',
                Icons.check_circle,
                const Color(0xFF10b981),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleCard(String title, String description, String author, String readTime, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5f41c4).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF5f41c4),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a0a0a),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF64748b),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  author,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5f41c4),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  readTime,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748b),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a0a0a),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748b),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}