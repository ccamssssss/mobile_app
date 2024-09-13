import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align elements closer to the top
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center align the children
          children: [
            // Logo
            Image.asset(
              'assets/logo.png',
              height: 200, // Adjust the height if needed
            ),
            SizedBox(
                height: 24), // Reduce space between the logo and text fields
            // Email TextField
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0B8A8), // Background color of the text field
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(-3, -3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    offset: Offset(3, 3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Color(0xFF013220)), // Change label color
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Password TextField
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0B8A8), // Background color of the text field
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(-3, -3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    offset: Offset(3, 3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: Color(0xFF013220)), // Change label color
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
                height:
                    24), // Adjust the spacing between fields and the login button
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home page
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white), // Set button text color to white
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF013220), // Button background color
              ),
            ),
            SizedBox(
                height:
                    16), // Add space between the login button and sign-up link
            // Sign Up Redirect
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up');
              },
              child: Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(
                    color: Color(0xFF013220)), // Set text color to #013220
              ),
            ),
          ],
        ),
      ),
    );
  }
}
