import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onNext;
  final VoidCallback onBack;
  final Map<String, dynamic>? userData;

  const ProfileSetupScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    this.userData,
  });

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  
  String _selectedGender = '';
  String _selectedActivityLevel = '';
  String _selectedUnit = 'metric'; // metric or imperial

  final List<Map<String, dynamic>> _genderOptions = [
    {'value': 'male', 'label': 'Male', 'icon': Icons.male},
    {'value': 'female', 'label': 'Female', 'icon': Icons.female},
    {'value': 'other', 'label': 'Other', 'icon': Icons.person},
  ];

  final List<Map<String, dynamic>> _activityLevels = [
    {
      'value': 'sedentary',
      'label': 'Sedentary',
      'description': 'Little or no exercise',
      'icon': Icons.weekend,
    },
    {
      'value': 'light',
      'label': 'Lightly Active',
      'description': 'Light exercise 1-3 days/week',
      'icon': Icons.directions_walk,
    },
    {
      'value': 'moderate',
      'label': 'Moderately Active',
      'description': 'Moderate exercise 3-5 days/week',
      'icon': Icons.directions_run,
    },
    {
      'value': 'active',
      'label': 'Very Active',
      'description': 'Hard exercise 6-7 days/week',
      'icon': Icons.fitness_center,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Pre-fill name if available from user data
    if (widget.userData?['name'] != null) {
      // Name is already available from signup, no need to ask again
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedGender.isEmpty) {
      _showSnackBar('Please select your gender');
      return;
    }
    if (_selectedActivityLevel.isEmpty) {
      _showSnackBar('Please select your activity level');
      return;
    }

    final profileData = {
      'age': int.tryParse(_ageController.text) ?? 0,
      'height': double.tryParse(_heightController.text) ?? 0.0,
      'weight': double.tryParse(_weightController.text) ?? 0.0,
      'gender': _selectedGender,
      'activityLevel': _selectedActivityLevel,
      'unit': _selectedUnit,
      'setupComplete': true,
    };

    widget.onNext(profileData);
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
                        '1 of 3',
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
                    value: 0.33,
                    backgroundColor: const Color(0xFFe2e8f0),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF5f41c4)),
                    minHeight: 4,
                  ),

                  const SizedBox(height: 32),

                  // Title and Subtitle
                  const Text(
                    'Tell us about yourself',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a0a0a),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Help us personalize your wellness experience',
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Unit Selection
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFf8fafc),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedUnit = 'metric'),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _selectedUnit == 'metric'
                                        ? const Color(0xFF5f41c4)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Metric (kg/cm)',
                                    style: TextStyle(
                                      color: _selectedUnit == 'metric'
                                          ? Colors.white
                                          : const Color(0xFF64748b),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedUnit = 'imperial'),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _selectedUnit == 'imperial'
                                        ? const Color(0xFF5f41c4)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Imperial (lbs/ft)',
                                    style: TextStyle(
                                      color: _selectedUnit == 'imperial'
                                          ? Colors.white
                                          : const Color(0xFF64748b),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Basic Info Row
                      Row(
                        children: [
                          // Age Field
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Age',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0a0a0a),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _ageController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: '25',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFFe2e8f0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFFe2e8f0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFF5f41c4), width: 2),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFf8fafc),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    int? age = int.tryParse(value);
                                    if (age == null || age < 13 || age > 120) {
                                      return 'Invalid age';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Height Field
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Height ${_selectedUnit == 'metric' ? '(cm)' : '(ft)'}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0a0a0a),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _heightController,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: _selectedUnit == 'metric' ? '170' : '5.7',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFFe2e8f0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFFe2e8f0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFF5f41c4), width: 2),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFf8fafc),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    double? height = double.tryParse(value);
                                    if (height == null || height <= 0) {
                                      return 'Invalid';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Weight Field
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weight ${_selectedUnit == 'metric' ? '(kg)' : '(lbs)'}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0a0a0a),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _weightController,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: _selectedUnit == 'metric' ? '70' : '154',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFFe2e8f0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFFe2e8f0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: Color(0xFF5f41c4), width: 2),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFf8fafc),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    double? weight = double.tryParse(value);
                                    if (weight == null || weight <= 0) {
                                      return 'Invalid';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Gender Selection
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0a0a0a),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: _genderOptions.map((gender) {
                          bool isSelected = _selectedGender == gender['value'];
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedGender = gender['value']),
                              child: Container(
                                margin: const EdgeInsets.only(right: 8),
                                padding: const EdgeInsets.symmetric(vertical: 16),
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
                                child: Column(
                                  children: [
                                    Icon(
                                      gender['icon'],
                                      color: isSelected
                                          ? const Color(0xFF5f41c4)
                                          : const Color(0xFF64748b),
                                      size: 24,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      gender['label'],
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
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 32),

                      // Activity Level Selection
                      const Text(
                        'Activity Level',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0a0a0a),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ..._activityLevels.map((activity) {
                        bool isSelected = _selectedActivityLevel == activity['value'];
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedActivityLevel = activity['value']),
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
                                    activity['icon'],
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
                                          activity['label'],
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
                                          activity['description'],
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

                      const SizedBox(height: 40),
                    ],
                  ),
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