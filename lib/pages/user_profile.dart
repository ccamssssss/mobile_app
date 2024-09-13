import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        automaticallyImplyLeading: true, // This adds the back button
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('User Profile', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/user_profile');
                      },
                      child:
                          Icon(Icons.account_circle, color: Colors.brown[800]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // User Information
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF013220), // Dark green color for background
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hey, @ccamelion',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Edit', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email Address: 12203300@koi.edu.au',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('Edit', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password: ********',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('Edit', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Saved Recipes Section
              Text(
                'Saved Recipes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
              SizedBox(height: 16),
              _buildRecipeCarousel(),
              SizedBox(height: 20),
              // Preferred Brewing Methods Section
              Text(
                'Preferred Brewing Methods',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
              SizedBox(height: 16),
              _buildBrewingMethodsCarousel(),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Sign out and navigate to login page, removing back button
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text('Sign Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[800], // Use backgroundColor
                    foregroundColor: Colors.white, // Use foregroundColor
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          _navigateToPage(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home_icon.png', height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/brew_guide_icon.png', height: 24),
            label: 'Brew Guide',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/kopi_library_icon.png', height: 24),
            label: 'KOPI Library',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/kopi_journal_icon.png', height: 24),
            label: 'KOPI Journal',
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCarousel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildRecipeItem('assets/iced_latte.png', 'Iced Latte'),
        _buildRecipeItem('assets/peppermint_mocha.png', 'Peppermint'),
      ],
    );
  }

  Widget _buildRecipeItem(String imagePath, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
      ],
    );
  }

  Widget _buildBrewingMethodsCarousel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBrewingMethodItem('assets/french_press.png', 'French Press'),
        _buildBrewingMethodItem('assets/espresso.png', 'Espresso'),
        _buildBrewingMethodItem('assets/aeropress.png', 'Aeropress'),
      ],
    );
  }

  Widget _buildBrewingMethodItem(String imagePath, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
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
