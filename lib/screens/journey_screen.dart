// File: lib/screens/journey_screen.dart

import 'package:flutter/material.dart';
import '../utils/asset_manager.dart';

class MyJourneyScreen extends StatefulWidget {
  const MyJourneyScreen({super.key});

  @override
  State<MyJourneyScreen> createState() => _MyJourneyScreenState();
}

class _MyJourneyScreenState extends State<MyJourneyScreen>
    with SingleTickerProviderStateMixin<MyJourneyScreen> {
  late TabController _tabController;

  // Sample data with local images
  final List<Map<String, dynamic>> timelineEntries = [
    {
      'date': '2025-01-20',
      'text': 'New personal best on deadlifts! 185lbs x 5 reps 🔥',
      'image': AssetManager.workoutDeadlift,
      'type': 'workout',
    },
    {
      'date': '2025-01-18',
      'text': 'Meal prep Sunday completed! Ready for the week 💪',
      'image': AssetManager.nutritionMealprep,
      'type': 'nutrition',
    },
    {
      'date': '2025-01-15',
      'text': 'Morning yoga session - feeling centered and strong 🧘‍♂️',
      'image': AssetManager.workoutYoga,
      'type': 'workout',
    },
    {
      'date': '2025-01-12',
      'text': 'Progress check-in: Down 2lbs and feeling amazing!',
      'image': AssetManager.progressAfter1,
      'type': 'progress',
    },
    {
      'date': '2025-01-10',
      'text': 'HIIT cardio session complete. Heart rate zones on point! ❤️',
      'image': AssetManager.workoutCardio,
      'type': 'workout',
    },
  ];

  final List<Map<String, String>> mealPlan = [
    {
      'meal': 'Breakfast',
      'food': 'Oatmeal with berries & protein powder',
      'calories': '420',
      'image': AssetManager.nutritionBowl,
    },
    {
      'meal': 'Lunch',
      'food': 'Grilled chicken, quinoa & vegetables',
      'calories': '580',
      'image': AssetManager.nutritionMealprep,
    },
    {
      'meal': 'Snack',
      'food': 'Protein shake with banana',
      'calories': '280',
      'image': AssetManager.nutritionShake,
    },
    {
      'meal': 'Dinner',
      'food': 'Salmon, sweet potato & asparagus',
      'calories': '650',
      'image': AssetManager.nutritionSalad,
    },
  ];

  final List<Map<String, String>> workoutPlan = [
    {
      'exercise': 'Deadlifts',
      'sets': '4 x 8-10',
      'image': AssetManager.workoutDeadlift,
    },
    {
      'exercise': 'Bench Press',
      'sets': '4 x 8-12',
      'image': AssetManager.workoutBench,
    },
    {
      'exercise': 'Squats',
      'sets': '3 x 12-15',
      'image': AssetManager.workoutSquats,
    },
    {
      'exercise': 'Cardio Finisher',
      'sets': '15 minutes',
      'image': AssetManager.workoutCardio,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Journey',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildQuickStats(),
            _buildChart(),
            const SizedBox(height: 12),
            _buildTabSection(),
            const SizedBox(height: 20),
            _buildTimelineSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _statWidget("Current Weight", "72kg", Colors.blue),
                _statWidget("Goal Weight", "68kg", Colors.green),
                _statWidget("Streak", "18d", Colors.orange),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.trending_down, color: Colors.blue[700]),
                  const SizedBox(width: 8),
                  Text(
                    "4kg lost this month!",
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w600,
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

  Widget _statWidget(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildChart() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weight Progress',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildChartBar('Jan', 0.8, Colors.blue[300]!),
                  _buildChartBar('Feb', 0.6, Colors.blue[400]!),
                  _buildChartBar('Mar', 0.4, Colors.blue[500]!),
                  _buildChartBar('Apr', 0.3, Colors.blue[600]!),
                  _buildChartBar('May', 0.2, Colors.blue[700]!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartBar(String month, double height, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: 80 * height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 8),
        Text(month, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTabSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: "Meal Plan"),
              Tab(text: "Workout"),
              Tab(text: "Photos"),
            ],
          ),
          SizedBox(
            height: 250,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMealPlan(),
                _buildWorkoutPlan(),
                _buildProgressPhotos(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealPlan() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mealPlan.length,
      itemBuilder: (context, index) {
        final meal = mealPlan[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                meal['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              meal['meal']!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(meal['food']!),
            trailing: Text(
              '${meal['calories']!} cal',
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWorkoutPlan() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: workoutPlan.length,
      itemBuilder: (context, index) {
        final exercise = workoutPlan[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                exercise['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              exercise['exercise']!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(exercise['sets']!),
            trailing: Checkbox(value: false, onChanged: (value) {}),
          ),
        );
      },
    );
  }

  Widget _buildProgressPhotos() {
    final progressImages = [
      AssetManager.progressBefore1,
      AssetManager.progressAfter1,
      AssetManager.progressBefore1,
      AssetManager.progressAfter1,
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: progressImages.length + 2, // +2 for add photo buttons
      itemBuilder: (context, index) {
        if (index < progressImages.length) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(progressImages[index], fit: BoxFit.cover),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey[300]!,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo, color: Colors.grey[600], size: 32),
                const SizedBox(height: 8),
                Text(
                  'Add Photo',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildTimelineSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Activity",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton.icon(
                icon: const Icon(Icons.add, color: Colors.blue),
                label: const Text("Add Entry"),
                onPressed: () {},
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: timelineEntries.length,
          itemBuilder: (context, index) {
            final entry = timelineEntries[index];
            return _timelineItem(
              entry['date']!,
              entry['text']!,
              entry['image'],
              entry['type']!,
            );
          },
        ),
      ],
    );
  }

  Widget _timelineItem(
    String date,
    String text,
    String? imageAsset,
    String type,
  ) {
    IconData getIcon() {
      switch (type) {
        case 'workout':
          return Icons.fitness_center;
        case 'nutrition':
          return Icons.restaurant;
        case 'progress':
          return Icons.trending_up;
        default:
          return Icons.event;
      }
    }

    Color getColor() {
      switch (type) {
        case 'workout':
          return Colors.blue;
        case 'nutrition':
          return Colors.green;
        case 'progress':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: imageAsset != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageAsset,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              )
            : CircleAvatar(
                backgroundColor: getColor().withOpacity(0.1),
                child: Icon(getIcon(), color: getColor(), size: 24),
              ),
        title: Text(
          DateTime.parse(date).day == DateTime.now().day ? 'Today' : date,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(text),
        trailing: Icon(Icons.more_vert, size: 16, color: Colors.grey[600]),
      ),
    );
  }
}
