import 'package:flutter/material.dart';

class MyJourneyScreen extends StatefulWidget {
  const MyJourneyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyJourneyScreenState createState() => _MyJourneyScreenState();
}

class _MyJourneyScreenState extends State<MyJourneyScreen>
    with SingleTickerProviderStateMixin<MyJourneyScreen> {
  late TabController _tabController;

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

  Widget _buildQuickStats() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _statWidget("Weight", "72kg"),
            _statWidget("Goal", "68kg"),
            _statWidget("Streak", "18d"),
          ],
        ),
      ),
    );
  }

  Widget _statWidget(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildChart() {
    // Placeholder for chart. Add chart package or custom painter for real data.
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        height: 180,
        alignment: Alignment.center,
        child: Text(
          'Progress Chart (Weight)',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ),
    );
  }

  Widget _buildMealPlan() {
    // Placeholder for a daily meal plan
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          "Today's Meal Plan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.breakfast_dining),
          title: Text('Breakfast'),
          subtitle: Text('Oatmeal, Egg whites'),
        ),
        ListTile(
          leading: Icon(Icons.lunch_dining),
          title: Text('Lunch'),
          subtitle: Text('Chicken breast, Rice, Broccoli'),
        ),
        ListTile(
          leading: Icon(Icons.dinner_dining),
          title: Text('Dinner'),
          subtitle: Text('Salmon, Quinoa, Asparagus'),
        ),
      ],
    );
  }

  Widget _buildWorkoutPlan() {
    // Placeholder for a daily workout plan
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          "Today's Workout",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.fitness_center),
          title: Text('Chest & Triceps'),
          subtitle: Text('Bench Press, Push-ups, Tricep Dips'),
        ),
        ListTile(
          leading: Icon(Icons.directions_run),
          title: Text('Cardio'),
          subtitle: Text('20 min Treadmill'),
        ),
      ],
    );
  }

  Widget _buildProgressPhotos() {
    // Placeholder for progress photos
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.photo_camera, color: Colors.grey[700]),
        );
      }),
    );
  }

  Widget _buildTimelineFeed() {
    // Placeholder for the timeline feed
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _timelineItem(
          "2025-06-10",
          "Down 1.5kg in 2 weeks! Feeling good 💪",
          null,
        ),
        _timelineItem("2025-06-01", "Started new workout plan today.", null),
      ],
    );
  }

  Widget _timelineItem(String date, String text, String? imageAsset) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            : const Icon(Icons.fitness_center, color: Colors.blue, size: 36),
        title: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(text),
        trailing: const Icon(Icons.edit, size: 20),
      ),
    );
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
              height: 200, // Fixed height for tab content
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMealPlan(),
                  _buildWorkoutPlan(),
                  _buildProgressPhotos(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Timeline",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.add, color: Colors.blue),
                    label: const Text("Add Progress"),
                    onPressed: () {
                      // Add your logic to open a dialog or add progress here.
                    },
                  ),
                ],
              ),
            ),
            _buildTimelineFeed(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
