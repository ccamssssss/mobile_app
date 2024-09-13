import 'package:flutter/material.dart';

class IcedLatteDetailPage extends StatefulWidget {
  @override
  _IcedLatteDetailPageState createState() => _IcedLatteDetailPageState();
}

class _IcedLatteDetailPageState extends State<IcedLatteDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        automaticallyImplyLeading: true, // Adds the default back button
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
                        backgroundImage: AssetImage('assets/iced_latte.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Iced Latte',
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
                    Text('• Espresso: 1-2 shots (about 1-2 ounces)'),
                    Text(
                        '• Milk: 6-8 ounces (any kind you prefer: whole, skim, almond, oat, etc.)'),
                    Text('• Ice: Enough to fill your glass'),
                    Text(
                        '• Sweetener (optional): Sugar, simple syrup, or any sweetener of your choice'),
                    Text(
                        '• Flavorings (optional): Vanilla syrup, caramel syrup, etc.'),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• Espresso machine or a coffee maker'),
                      Text('• Tall glass'),
                      Text('• Spoon'),
                      Text('• Milk frother (optional)'),
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
              SizedBox(height: 16),

              // PageView for Instructions with Next button
              Container(
                height: 400, // Adjust height based on image size
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: 6,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              _getInstructionImage(index + 1),
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Step ${index + 1}: ${_getInstruction(index + 1)}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF013220),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                    Positioned(
                      right: 16.0,
                      bottom: 16.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: _currentPage < 5
                            ? () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : null,
                      ),
                    ),
                    Positioned(
                      left: 16.0,
                      bottom: 16.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: _currentPage > 0
                            ? () {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showSavedSnackbar(context);
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
        currentIndex: 2, // Highlights the 'KOPI Library' icon
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
        return 'Brew Espresso: Make 1-2 shots of espresso or use strong coffee.';
      case 2:
        return 'Fill a Glass with Ice: Add a cup of ice cubes to a tall glass.';
      case 3:
        return 'Pour Espresso: Pour the hot espresso over the ice.';
      case 4:
        return 'Add Milk: Fill the glass with cold milk (about 1 cup).';
      case 5:
        return 'Sweeten (Optional): Add sugar or syrup if you like it sweet.';
      case 6:
        return 'Stir and Enjoy: Mix well and enjoy your iced latte!';
      default:
        return '';
    }
  }

  String _getInstructionImage(int step) {
    switch (step) {
      case 1:
        return 'assets/instructions/step1.png';
      case 2:
        return 'assets/instructions/step2.png';
      case 3:
        return 'assets/instructions/step3.png';
      case 4:
        return 'assets/instructions/step4.png';
      case 5:
        return 'assets/instructions/step5.png';
      case 6:
        return 'assets/instructions/step6.png';
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

  void _showSavedSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.white),
          SizedBox(width: 8),
          Text('Great! Added to Favorites'),
        ],
      ),
      backgroundColor: Color(0xFF013220),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      action: SnackBarAction(
        label: 'x',
        textColor: const Color.fromARGB(255, 255, 255, 255),
        onPressed: () {
          // Optional: add some functionality when close is clicked
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
