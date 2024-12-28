import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildMenuItem(context, Icons.account_balance_wallet, 'Account\nand Card', '/account'),
                  _buildMenuItem(context, Icons.send, 'Send Money', '/sendmoney'),
                  _buildMenuItem(context, Icons.hd, 'Withdraw', '/withdraw'),
                  _buildMenuItem(context, Icons.phone_android, 'Mobile\nrecharge', '/mobilerecharge'),
                  _buildMenuItem(context, Icons.dashboard, 'Dash board', '/dashboard'), // Placeholder route
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}