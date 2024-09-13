import 'package:flutter/material.dart';

class SaltedCaramelDetailPage extends StatelessWidget {
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
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF013220), // Background color
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/salted_caramel_macchiato.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Salted Caramel Macchiato',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.brown[800], // Optionally, you can add color here
                  ),
                ),
              ),

              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• 1 shot (1 oz or 30 ml) of espresso)'),
                    Text(
                        '• 1 tablespoon of caramel sauce (plus more for drizzling)'),
                    Text('• 8 oz (240 ml) of milk'),
                    Text('• 1/4 teaspoon of sea salt'),
                    Text('• Optional: whipped cream for topping'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Equipment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.brown[800], // Optionally, you can add color here
                  ),
                ),
              ),

              SizedBox(height: 8),
              Center(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.brown,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• Espresso machine or strong brewed coffee'),
                      Text('• Milk frother or steam wand'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              Center(
                child: Text(
                  'Instructions:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
              ),

              SizedBox(height: 8),
              for (var i = 1; i <= 6; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Step $i: ${_getInstruction(i)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF013220),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement add to favorites functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF013220),
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Add to Favorites'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/kopi_journal');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[800],
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Log to KOPI Journal'),
                  ),
                ],
              ),
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

  String _getInstruction(int step) {
    switch (step) {
      case 1:
        return 'Brew the Espresso: Brew a fresh shot of espresso using an espresso machine. If you don`t have an espresso machine, you can use a Moka pot or an Aeropress to make a strong coffee concentrate.';
      case 2:
        return 'Heat Milk: Warm 8 oz of milk and stir in 1 tablespoon of caramel sauce until it`s fully mixed. Add a pinch of sea salt to the milk.';
      case 3:
        return 'Assemble: Pour the warm caramel milk into a cup, then slowly pour the espresso on top so it floats.';
      case 4:
        return 'Finish: Drizzle more caramel sauce on top. Optionally, add whipped cream and a tiny sprinkle of sea salt.';
      default:
        return '';
    }
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
