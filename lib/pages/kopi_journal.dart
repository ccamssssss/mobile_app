import 'package:flutter/material.dart';

class KopiJournalPage extends StatefulWidget {
  @override
  _KopiJournalPageState createState() => _KopiJournalPageState();
}

class _KopiJournalPageState extends State<KopiJournalPage> {
  bool isEditingJournal1 = false; // Track whether we are editing Journal #1
  final _journal1TitleController = TextEditingController(text: "Journal #1");
  final _journal1ContentController = TextEditingController(); // Journal content

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: isEditingJournal1
          ? _buildJournalEditor() // Show the editor if editing
          : _buildJournalGrid(), // Show the grid otherwise
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
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

  // Widget for Journal Editor (Editing Journal #1)
  Widget _buildJournalEditor() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Field
          TextField(
            controller: _journal1TitleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          SizedBox(height: 16),
          // Content Field
          TextField(
            controller: _journal1ContentController,
            decoration: InputDecoration(labelText: 'Content'),
            maxLines: 10,
          ),
          SizedBox(height: 20),
          // Save and Cancel Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditingJournal1 = false; // Exit editing mode
                  });
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[800],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditingJournal1 = false; // Exit editing without saving
                  });
                },
                child: Text('Cancel'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for Journal Grid
  Widget _buildJournalGrid() {
    return SingleChildScrollView(
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
                  Icon(Icons.account_circle, color: Colors.brown[800]),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'KOPI Journal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Journal Grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
              children: [
                _buildKopiJournalItem(
                    context, 'Journal #1', 'assets/journal1.png', () {
                  setState(() {
                    isEditingJournal1 =
                        true; // Enable editing mode for Journal #1
                  });
                }),
                _buildKopiJournalItem(
                    context, 'Journal #2', 'assets/journal1.png', null),
                // Add more journal items here
              ],
            ),
            SizedBox(height: 20),
            Text(
              'KOPI Memories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildKopiMemoryItem(context, '17/12/23', 'assets/memory1.png'),
                _buildKopiMemoryItem(context, '27/08/24', 'assets/memory2.png'),
                _buildKopiMemoryItem(context, '03/09/24', 'assets/memory3.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Journal Item Builder
  Widget _buildKopiJournalItem(
      BuildContext context, String title, String imagePath, Function? onTap) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
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

  // Memory Item Builder
  Widget _buildKopiMemoryItem(
      BuildContext context, String date, String imagePath) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF013220),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
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
          date,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  // Bottom Navigation Bar Navigation
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
