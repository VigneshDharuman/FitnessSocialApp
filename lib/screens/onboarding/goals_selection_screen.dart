import 'package:flutter/material.dart';

class GoalsSelectionScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onNext;
  final VoidCallback onBack;

  const GoalsSelectionScreen({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<GoalsSelectionScreen> createState() => _GoalsSelectionScreenState();
}

class _GoalsSelectionScreenState extends State<GoalsSelectionScreen> {
  String _primaryGoal = '';
  List<String> _focusAreas = [];
  String _experienceLevel = '';
  int _workoutFrequency = 3;
  List<String> _preferredWorkoutTypes = [];

  final List<Map<String, dynamic>> _goalOptions = [
    {
      'value': 'lose_weight',
      'title': 'Lose Weight',
      'description': 'Achieve healthy weight management',
      'icon': Icons.trending_down,
      'color': Color(0xFFf59e0b),
    },
    {
      'value': 'build_muscle',
      'title': 'Build Strength',
      'description': 'Gain strength and muscle tone',
      'icon': Icons.fitness_center,
      'color': Color(0xFF10b981),
    },
    {
      'value': 'improve_endurance',
      'title': 'Improve Endurance',
      'description': 'Boost stamina and cardiovascular wellness',
      'icon': Icons.directions_run,
      'color': Color(0xFF3b82f6),
    },
    {
      'value': 'get_stronger',
      'title': 'Get Stronger',
      'description': 'Increase overall strength and vitality',
      'icon': Icons.sports_gymnastics,
      'color': Color(0xFF8b5cf6),
    },
    {
      'value': 'stay_healthy',
      'title': 'Stay Healthy',
      'description': 'Maintain overall wellness and balance',
      'icon': Icons.favorite,
      'color': Color(0xFFec4899),
    },
    {
      'value': 'improve_flexibility',
      'title': 'Improve Flexibility',
      'description': 'Enhance mobility and flexibility',
      'icon': Icons.self_improvement,
      'color': Color(0xFF06b6d4),
    },
  ];

  final List<Map<String, dynamic>> _focusAreaOptions = [
    {'value': 'full_body', 'label': 'Full Body', 'icon': Icons.accessibility},
    {'value': 'upper_body', 'label': 'Upper Body', 'icon': Icons.sports_gymnastics},
    {'value': 'lower_body', 'label': 'Lower Body', 'icon': Icons.directions_run},
    {'value': 'core', 'label': 'Core', 'icon': Icons.center_focus_strong},
    {'value': 'cardio', 'label': 'Cardio', 'icon': Icons.favorite},
    {'value': 'flexibility', 'label': 'Flexibility', 'icon': Icons.self_improvement},
  ];

  final List<Map<String, dynamic>> _experienceLevels = [
    {
      'value': 'beginner',
      'title': 'Beginner',
      'description': 'New to fitness or getting back into it',
      'icon': Icons.school,
    },
    {
      'value': 'intermediate',
      'title': 'Intermediate',
      'description': 'Some experience with regular workouts',
      'icon': Icons.trending_up,
    },
    {
      'value': 'advanced',
      'title': 'Advanced',
      'description': 'Experienced with consistent training',
      'icon': Icons.military_tech,
    },
  ];

  final List<Map<String, dynamic>> _workoutTypes = [
    {'value': 'strength', 'label': 'Strength Training', 'icon': Icons.fitness_center},
    {'value': 'cardio', 'label': 'Cardio', 'icon': Icons.directions_run},
    {'value': 'yoga', 'label': 'Yoga', 'icon': Icons.self_improvement},
    {'value': 'hiit', 'label': 'HIIT', 'icon': Icons.flash_on},
    {'value': 'pilates', 'label': 'Pilates', 'icon': Icons.spa},
    {'value': 'dance', 'label': 'Dance', 'icon': Icons.music_note},
  ];

  void _handleNext() {
    if (_primaryGoal.isEmpty) {
      _showSnackBar('Please select your primary goal');
      return;
    }
    if (_focusAreas.isEmpty) {
      _showSnackBar('Please select at least one focus area');
      return;
    }
    if (_experienceLevel.isEmpty) {
      _showSnackBar('Please select your experience level');
      return;
    }
    if (_preferredWorkoutTypes.isEmpty) {
      _showSnackBar('Please select at least one workout type');
      return;
    }

    final goalsData = {
      'primaryGoal': _primaryGoal,
      'focusAreas': _focusAreas,
      'experienceLevel': _experienceLevel,
      'workoutFrequency': _workoutFrequency,
      'preferredWorkoutTypes': _preferredWorkoutTypes,
      'goalsComplete': true,
    };

    widget.onNext(goalsData);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFdc2626),
      ),
    );
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
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: widget.onBack,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF0a0a0a),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '2 of 3',
                        style: TextStyle(
                          color: Color(0xFF64748b),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Progress Indicator
                  LinearProgressIndicator(
                    value: 0.66,
                    backgroundColor: const Color(0xFFe2e8f0),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF5f41c4)),
                    minHeight: 4,
                  ),

                  const SizedBox(height: 32),

                  // Title and Subtitle
                  const Text(
                    'What are your goals?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a0a0a),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Help us create your personalized wellness plan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF64748b),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Primary Goal Selection
                    const Text(
                      'Primary Goal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0a0a0a),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: _goalOptions.length,
                      itemBuilder: (context, index) {
                        final goal = _goalOptions[index];
                        bool isSelected = _primaryGoal == goal['value'];
                        return GestureDetector(
                          onTap: () => setState(() => _primaryGoal = goal['value']),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? (goal['color'] as Color).withOpacity(0.1)
                                  : const Color(0xFFf8fafc),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? (goal['color'] as Color)
                                    : const Color(0xFFe2e8f0),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  goal['icon'],
                                  color: isSelected
                                      ? (goal['color'] as Color)
                                      : const Color(0xFF64748b),
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  goal['title'],
                                  style: TextStyle(
                                    color: isSelected
                                        ? (goal['color'] as Color)
                                        : const Color(0xFF0a0a0a),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  goal['description'],
                                  style: const TextStyle(
                                    color: Color(0xFF64748b),
                                    fontSize: 11,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // Focus Areas Selection
                    const Text(
                      'Focus Areas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0a0a0a),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select all that apply',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748b),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _focusAreaOptions.map((area) {
                        bool isSelected = _focusAreas.contains(area['value']);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _focusAreas.remove(area['value']);
                              } else {
                                _focusAreas.add(area['value']);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF5f41c4).withOpacity(0.1)
                                  : const Color(0xFFf8fafc),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF5f41c4)
                                    : const Color(0xFFe2e8f0),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  area['icon'],
                                  color: isSelected
                                      ? const Color(0xFF5f41c4)
                                      : const Color(0xFF64748b),
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  area['label'],
                                  style: TextStyle(
                                    color: isSelected
                                        ? const Color(0xFF5f41c4)
                                        : const Color(0xFF64748b),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 32),

                    // Experience Level
                    const Text(
                      'Experience Level',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0a0a0a),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._experienceLevels.map((level) {
                      bool isSelected = _experienceLevel == level['value'];
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () => setState(() => _experienceLevel = level['value']),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF5f41c4).withOpacity(0.1)
                                  : const Color(0xFFf8fafc),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF5f41c4)
                                    : const Color(0xFFe2e8f0),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  level['icon'],
                                  color: isSelected
                                      ? const Color(0xFF5f41c4)
                                      : const Color(0xFF64748b),
                                  size: 24,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        level['title'],
                                        style: TextStyle(
                                          color: isSelected
                                              ? const Color(0xFF5f41c4)
                                              : const Color(0xFF0a0a0a),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        level['description'],
                                        style: const TextStyle(
                                          color: Color(0xFF64748b),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF5f41c4),
                                    size: 20,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 32),

                    // Workout Frequency
                    const Text(
                      'Weekly Workout Frequency',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0a0a0a),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFf8fafc),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFe2e8f0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$_workoutFrequency days per week',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF5f41c4),
                                ),
                              ),
                              Icon(
                                Icons.fitness_center,
                                color: const Color(0xFF5f41c4),
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: const Color(0xFF5f41c4),
                              inactiveTrackColor: const Color(0xFFe2e8f0),
                              thumbColor: const Color(0xFF5f41c4),
                              overlayColor: const Color(0xFF5f41c4).withOpacity(0.2),
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                            ),
                            child: Slider(
                              value: _workoutFrequency.toDouble(),
                              min: 1,
                              max: 7,
                              divisions: 6,
                              onChanged: (value) {
                                setState(() {
                                  _workoutFrequency = value.round();
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1 day',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '7 days',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Preferred Workout Types
                    const Text(
                      'Preferred Workout Types',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0a0a0a),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select all that interest you',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748b),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _workoutTypes.map((type) {
                        bool isSelected = _preferredWorkoutTypes.contains(type['value']);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _preferredWorkoutTypes.remove(type['value']);
                              } else {
                                _preferredWorkoutTypes.add(type['value']);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF5f41c4).withOpacity(0.1)
                                  : const Color(0xFFf8fafc),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF5f41c4)
                                    : const Color(0xFFe2e8f0),
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  type['icon'],
                                  color: isSelected
                                      ? const Color(0xFF5f41c4)
                                      : const Color(0xFF64748b),
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  type['label'],
                                  style: TextStyle(
                                    color: isSelected
                                        ? const Color(0xFF5f41c4)
                                        : const Color(0xFF64748b),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _handleNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5f41c4),
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: const Color(0xFF5f41c4).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
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
    );
  }
}