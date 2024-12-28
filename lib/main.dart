import 'package:flutter/material.dart';
import 'screens/forgotpassword.dart';
import 'screens/sendmoney.dart';
import 'screens/pay_bills.dart';
import 'screens/home_page.dart';
import 'screens/account.dart';
import 'screens/mobilerecharge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/forgotpassword': (context) => const ForgotPasswordPage(),
        '/sendmoney': (context) => const SendMoneyPage(),
        '/paybills': (context) => const PayBillsPage(),
        '/account': (context) => const AccountPage(),
        '/withdraw': (context) => const WithdrawPage(),
        '/mobilerecharge': (context) => const MobileRechargePage(),
        '/dashboard': (context) => const PlaceholderPage(), // Placeholder route
      },
    );
  }
}

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'),
      ),
      body: const Center(
        child: Text('Withdraw Page'),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Center(
        child: Text('Dashboard Page'),
      ),
    );
  }
}