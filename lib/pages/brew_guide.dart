import 'package:flutter/material.dart';

class BrewGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        automaticallyImplyLeading: true, // This adds the default back button
        iconTheme: IconThemeData(color: Colors.white), // Set back button color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar (without back button)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.brown[800]),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.account_circle, color: Colors.brown[800]),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Brew Guide',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Brewing Method Guide
              _buildBrewGuideItem(
                  context,
                  'French Press',
                  'assets/french_press.png',
                  'Known for its full-bodied flavor, the French press is perfect for those who enjoy a robust cup.',
                  'Grind Size: Coarse\nBrew Time: 4 minutes\nWater Temperature: 200°F (93°C)',
                  '/french_press' // Navigates to French Press detail page
                  ),
              SizedBox(height: 16),
              _buildBrewGuideItem(
                  context,
                  'Espresso',
                  'assets/espresso.png',
                  'Espresso is a concentrated coffee with a rich, bold flavor, perfect as a standalone shot or the base for various coffee drinks.',
                  'Grind Size: Fine (like powdered sugar)\nBrew Time: 25-30 seconds\nWater Temperature: 200°F (93°C)',
                  null // No navigation for this item for now
                  ),
              SizedBox(height: 16),
              _buildBrewGuideItem(
                  context,
                  'Pour Over (e.g., V60, Chemex)',
                  'assets/pour_over.png',
                  'Pour Over brewing, popularized by methods like V60 and Chemex, delivers a clean, bright cup with enhanced clarity of flavors.',
                  'Grind Size: Medium-fine (like sea salt)\nBrew Time: 3-4 minutes',
                  null // No navigation for this item for now
                  ),
              SizedBox(height: 16),
              _buildBrewGuideItem(
                  context,
                  'AeroPress',
                  'assets/aeropress.png',
                  'AeroPress is a versatile brewing method that can produce anything from a strong espresso-like coffee to a smooth, clean cup depending on technique.',
                  'Grind Size: Medium-fine (similar to table salt)\nBrew Time: 1-2 minutes\nWater Temperature: 175-185°F (80-85°C)',
                  null // No navigation for this item for now
                  ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // This highlights the 'Brew Guide' icon
        onTap: (index) {
          _navigateToPage(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home_icon.png',
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/brew_guide_icon.png',
              height: 24,
            ),
            label: 'Brew Guide',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/kopi_library_icon.png',
              height: 24,
            ),
            label: 'KOPI Library',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/kopi_journal_icon.png',
              height: 24,
            ),
            label: 'KOPI Journal',
          ),
        ],
      ),
    );
  }

  Widget _buildBrewGuideItem(
    BuildContext context,
    String title,
    String imagePath,
    String description,
    String quickTips,
    String? route,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image with background
        Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xFF013220), // Background color
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                'Quick Tips:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                quickTips,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (route != null) {
                    Navigator.pushNamed(context, route);
                  }
                },
                child: Text('Learn More'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF013220), // Specific green color
                  foregroundColor: Colors.white, // Text color set to white
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/brew_guide');
        break;
      case 2:
        Navigator.pushNamed(context, '/kopi_library');
        break;
      case 3:
        Navigator.pushNamed(context, '/kopi_journal');
        break;
    }
  }
}
