import 'package:chat_dasturi/core/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Kirish",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            WTextField(
              hintText: "namuna@gmail.com",
            ),
            SizedBox(height: 10),
            WTextField(
              hintText: "password",
              obscureText: true,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size(double.maxFinite, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: Text("Davom etish", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 30),
            RegisterElevatedButton(
              text: "Continue with Google",
              icon: Icons.settings,
            ),
            SizedBox(height: 20),
            RegisterElevatedButton(
              text: "Continue with Apple",
              icon: Icons.apple,
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterElevatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const RegisterElevatedButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.white),
        backgroundColor: Colors.black,
        fixedSize: Size(double.maxFinite, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}