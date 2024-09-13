import 'package:flutter/material.dart';

class KopiLibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
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
              // KOPI Library Title
              Center(
                child: Text(
                  'KOPI Library',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Coffee Recipes Grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    0.7, // Adjust the aspect ratio to prevent overflow
                children: [
                  _buildClickableKopiLibraryItem(context, 'Iced Latte',
                      'assets/iced_latte.png', '/iced_latte_detail'),
                  _buildClickableKopiLibraryItem(
                      context,
                      'Salted Caramel Macchiato',
                      'assets/salted_caramel_macchiato.png',
                      '/salted_caramel_detail'),
                  _buildStaticKopiLibraryItem(
                      'Flat White', 'assets/flat_white.png'),
                  _buildStaticKopiLibraryItem('Vanilla Almond Latte',
                      'assets/vanilla_almond_latte.png'),
                  _buildStaticKopiLibraryItem('Mocha Hazelnut Delight',
                      'assets/mocha_hazelnut_delight.png'),
                  _buildStaticKopiLibraryItem('Coconut Iced Coffee Breeze',
                      'assets/coconut_iced_coffee_breeze.png'),
                  _buildStaticKopiLibraryItem(
                      'Orange Mocha Frappe', 'assets/orange_mocha_frappe.png'),
                  _buildStaticKopiLibraryItem(
                      'Chai Coffee Fusion', 'assets/chai_coffee_fusion.png'),
                  _buildStaticKopiLibraryItem(
                      'Peppermint Mocha', 'assets/peppermint_mocha.png'),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2, // This highlights the 'KOPI Library' icon
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

  Widget _buildClickableKopiLibraryItem(
      BuildContext context, String title, String imagePath, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF013220),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStaticKopiLibraryItem(String title, String imagePath) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF013220),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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
