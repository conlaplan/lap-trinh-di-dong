import 'package:flutter/material.dart';
import 'package:my_app/screens/forgotpassword_sheet.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "You can search course, apply course and find scholarship for abroad studies",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 24),

            // Google & Facebook buttons (fake UI)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_socialButton("Google"), _socialButton("Facebook")],
            ),

            SizedBox(height: 24),
            TextField(decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) => ForgotPasswordSheet(),
                  );
                },
                child: Text("Forgot password"),
              ),
            ),

            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Handle login
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Login"),
            ),

            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("Don’t have an account? Join us"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [Icon(Icons.login, size: 18), SizedBox(width: 8), Text(name)],
      ),
    );
  }
}
