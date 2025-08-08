import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  final VoidCallback onComplete;
  final VoidCallback onBack;

  const TutorialScreen({
    super.key,
    required this.onComplete,
    required this.onBack,
  });

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _tutorialSteps = [
    {
      'title': 'Track Your Progress',
      'subtitle': 'Monitor your wellness journey with detailed insights',
      'description': 'View your activity history, progress photos, and achievements all in one place. Our AI-powered analytics help you understand your growth patterns.',
      'icon': Icons.trending_up,
      'color': Color(0xFF10b981),
      'features': ['Activity Analytics', 'Progress Photos', 'Personal Records'],
    },
    {
      'title': 'Connect with Community',
      'subtitle': 'Join a supportive wellness community',
      'description': 'Share your achievements, get motivated by others, and connect with coaches. Find wellness partners and celebrate milestones together.',
      'icon': Icons.people,
      'color': Color(0xFF3b82f6),
      'features': ['Share Progress', 'Find Partners', 'Expert Coaching'],
    },
    {
      'title': 'Learn & Grow',
      'subtitle': 'Access expert knowledge and tips',
      'description': 'Discover activity routines, nutrition advice, and wellness tips from certified professionals. Expand your wellness knowledge every day.',
      'icon': Icons.school,
      'color': Color(0xFF8b5cf6),
      'features': ['Expert Articles', 'Video Tutorials', 'Nutrition Tips'],
    },
    {
      'title': 'Stay Motivated',
      'subtitle': 'Get personalized recommendations',
      'description': 'Receive tailored activity suggestions, habit reminders, and motivational content based on your goals and preferences.',
      'icon': Icons.favorite,
      'color': Color(0xFFec4899),
      'features': ['Custom Activities', 'Smart Reminders', 'Goal Tracking'],
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _tutorialSteps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onComplete();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  if (_currentPage > 0)
                    IconButton(
                      onPressed: _previousPage,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF0a0a0a),
                      ),
                    )
                  else
                    const SizedBox(width: 48),
                  const Spacer(),
                  Text(
                    '${_currentPage + 1} of ${_tutorialSteps.length}',
                    style: const TextStyle(
                      color: Color(0xFF64748b),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: widget.onComplete,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF64748b),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Progress Indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LinearProgressIndicator(
                value: (_currentPage + 1) / _tutorialSteps.length,
                backgroundColor: const Color(0xFFe2e8f0),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF5f41c4)),
                minHeight: 4,
              ),
            ),

            // Tutorial Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _tutorialSteps.length,
                itemBuilder: (context, index) {
                  final step = _tutorialSteps[index];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),

                          // Icon and Color Background
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: (step['color'] as Color).withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              step['icon'],
                              size: 50,
                              color: step['color'],
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Title
                          Text(
                            step['title'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0a0a0a),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 8),

                          // Subtitle
                          Text(
                            step['subtitle'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: step['color'],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 16),

                          // Description
                          Text(
                            step['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748b),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 24),

                          // Features List
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFf8fafc),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFe2e8f0)),
                            ),
                            child: Column(
                              children: (step['features'] as List<String>).map((feature) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: (step['color'] as Color).withOpacity(0.2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 12,
                                          color: step['color'],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF0a0a0a),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Page Indicators
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _tutorialSteps.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xFF5f41c4)
                          : const Color(0xFFe2e8f0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  // Back Button (when not on first page)
                  if (_currentPage > 0)
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: OutlinedButton(
                          onPressed: _previousPage,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF5f41c4),
                            side: const BorderSide(
                              color: Color(0xFF5f41c4),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                  if (_currentPage > 0) const SizedBox(width: 16),

                  // Next/Get Started Button
                  Expanded(
                    flex: _currentPage > 0 ? 1 : 2,
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5f41c4),
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shadowColor: const Color(0xFF5f41c4).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          _currentPage == _tutorialSteps.length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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