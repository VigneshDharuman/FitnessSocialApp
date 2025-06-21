import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use an empty or branding AppBar if you want.
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight:
            0, // Hides AppBar visually, but keeps system spacing safe.
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Title and Icons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fitness Social App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          // Message action
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          // Notification action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Optionally, your branding/subtitle
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Text(
                "FitSocial",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ),
            // Stories
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.purple[100],
                      // Use AssetImage only if image exists!
                      // backgroundImage: AssetImage('assets/avatar${index % 5}.png'),
                    ),
                  );
                },
              ),
            ),
            // Feed (Expanded so it takes the rest of the space)
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple[100],
                            // backgroundImage: AssetImage('assets/avatar${index % 5}.png'),
                          ),
                          title: Text("Trainer Name $index"),
                          subtitle: Text("2 hours ago"),
                          trailing: Icon(Icons.more_vert),
                        ),
                        // Use a placeholder if image not found
                        Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: Center(
                            child: Text(
                              "Image Placeholder",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.comment_outlined),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.share_outlined),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Awesome workout session today! 💪 #fitness",
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'My Journey',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
