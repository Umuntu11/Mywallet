import 'package:flutter/material.dart';

// ForgotPasswordPage widget for the Forgot Password screen.
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController(); // Controller for email input.

  @override
  void dispose() {
    emailController.dispose(); // Dispose of the controller when the widget is removed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the main content.
        child: Column(
          children: [
            const Text(
              'Enter your email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16), // Spacer between elements.
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 16), // Spacer between elements.
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                if (email.isEmpty) {
                  // Show error message if email is empty.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your email')),
                  );
                } else {
                  // Navigate to OTP verification screen if email is provided.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPVerificationPage(email: email),
                    ),
                  );
                }
              },
              child: const Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
}

// OTPVerificationPage widget for displaying OTP verification screen.
class OTPVerificationPage extends StatelessWidget {
  final String email;

  const OTPVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Text('OTP sent to $email'),
      ),
    );
  }
}
