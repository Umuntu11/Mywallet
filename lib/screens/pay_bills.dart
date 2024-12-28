import 'package:flutter/material.dart';

class PayBillsPage extends StatefulWidget {
  const PayBillsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PayBillsPageState createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form state.
  String biller = ''; // Store the biller name.
  String accountNumber = ''; // Store the account number.
  double amount = 0.0; // Store the amount to pay.
  bool showSuccessMessage = false; // State for showing the success message.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Biller Name'),
                onChanged: (value) {
                  setState(() {
                    biller = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the biller name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Account Number'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    accountNumber = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the account number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ?? 0.0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      showSuccessMessage = true;
                    });
                  }
                },
                child: const Text('Pay Bill'),
              ),
              if (showSuccessMessage)
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Bill paid successfully!',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}