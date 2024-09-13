import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.brown[800],
        automaticallyImplyLeading: false, // Hides back button
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar with user icon
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search,
                        color: const Color.fromARGB(255, 60, 42, 36)),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the user profile page when the user icon is clicked
                        Navigator.pushNamed(context, '/user_profile');
                      },
                      child: Icon(Icons.account_circle,
                          color: const Color.fromARGB(255, 51, 36, 31)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // User Greeting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hey, @ccamelion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement edit profile functionality
                    },
                    child: Text('Edit'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Discover our featured brews',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Featured Brews
              _buildFeaturedBrew(
                context,
                'Iced Latte',
                'assets/iced_latte.png',
                'Taste the Refreshment: Experience the perfect blend of bold espresso, creamy milk, and sweet vanilla syrup over ice.',
                'Brew it now',
              ),
              SizedBox(height: 16),
              _buildFeaturedBrew(
                context,
                'Salted Caramel Macchiato',
                'assets/salted_caramel_macchiato.png',
                'Indulge in Sweet and Salty Bliss: Enjoy the rich espresso balanced with creamy, caramel-infused milk and a hint of sea salt.',
                'Brew it now',
              ),
              SizedBox(height: 20),
              Text(
                'Brewing method guide',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildBrewGuide(
                context,
                'French Press',
                'assets/french_press.png',
                'Known for its full-bodied flavor, the French press is perfect for those who enjoy a robust cup.',
                'Learn More',
              ),
              SizedBox(height: 20),
              Text(
                'Explore KOPI Library',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildKopiLibrary(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // This highlights the 'Home' icon
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

  Widget _buildFeaturedBrew(BuildContext context, String title,
      String imagePath, String description, String buttonText) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (title == 'Iced Latte') {
                    Navigator.pushNamed(context, '/iced_latte_detail');
                  } else if (title == 'Salted Caramel Macchiato') {
                    Navigator.pushNamed(context, '/salted_caramel_detail');
                  }
                },
                child: Text(buttonText),
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

  Widget _buildBrewGuide(BuildContext context, String title, String imagePath,
      String description, String buttonText) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/brew_guide');
                },
                child: Text(buttonText),
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

  Widget _buildKopiLibrary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLibraryItem('assets/library_item1.png', 'Mocha'),
        _buildLibraryItem('assets/library_item2.png', 'Latte'),
        _buildLibraryItem('assets/library_item3.png', 'Peppermint'),
        _buildLibraryItem('assets/library_item4.png', 'Cappuccino'),
      ],
    );
  }

  Widget _buildLibraryItem(String imagePath, String title) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(title), // Use the passed title for each item
      ],
    );
  }
}
