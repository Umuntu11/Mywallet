// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_pocket_wallet/screens/custom_button.dart';

// SendMoneyPage widget for the Send Money screen.
class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  SendMoneyPageState createState() => SendMoneyPageState();
}

class SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form state.
  String recipient = ''; // Store the recipient's details (name or number).
  double amount = 0.0; // Store the amount to send.
  String paymentMethod = ''; // Store the selected payment method.
  bool isFavorite = false; // Store the switch state for marking as a favorite.
  bool showSuccessMessage = false; // State for showing the success message.

  // Function to confirm the transaction and navigate to the confirmation page.
  void _confirmTransaction() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        showSuccessMessage = true; // Show the success message.
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          showSuccessMessage =
              false; // Hide the success message after 2 seconds.
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionConfirmationPage(
              recipient: recipient,
              amount: amount,
              paymentMethod: paymentMethod,
            ),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Send Money')), // AppBar with page title.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the main content.
        child: Form(
          key: _formKey, // Associating the form with the key.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Recipient input field.
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Recipient',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the recipient\'s name'; // Validate non-empty input.
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    recipient =
                        value; // Update recipient value when text changes.
                  });
                },
              ),
              const SizedBox(height: 16), // Spacer between input fields.

              // Amount input field.
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    TextInputType.number, // Only allows numeric input.
                validator: (value) {
                  double? parsedValue = double.tryParse(value ?? '');
                  if (parsedValue == null || parsedValue <= 0) {
                    return 'Please enter a valid amount'; // Validate positive number.
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ??
                        0.0; // Update amount if valid.
                  });
                },
              ),
              const SizedBox(height: 16), // Spacer between input fields.

              // Payment method dropdown.
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Payment Method',
                  border: OutlineInputBorder(),
                ),
                value: paymentMethod.isEmpty
                    ? null
                    : paymentMethod, // Set the initial value.
                items: const [
                  DropdownMenuItem(
                    value: 'Bank Account',
                    child: Text('Bank Account'),
                  ),
                  DropdownMenuItem(
                    value: 'Mobile Wallet',
                    child: Text('Mobile Wallet'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a payment method'; // Validate selection.
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    paymentMethod =
                        value ?? ''; // Update the payment method on selection.
                  });
                },
              ),
              const SizedBox(height: 16), // Spacer between input fields.

              // Favorite switch.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mark as Favorite',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: isFavorite,
                    onChanged: (value) {
                      setState(() {
                        isFavorite = value; // Update the switch state.
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16), // Spacer between input fields.

              // Proceed button to confirm transaction.
              CustomButton(
                text: 'Proceed to Confirm', // Button text.
                onPressed: () {
                  print('Proceed button pressed');
                  _confirmTransaction();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TransactionConfirmationPage widget for displaying and confirming the transaction details.
class TransactionConfirmationPage extends StatelessWidget {
  final String recipient;
  final double amount;
  final String paymentMethod;

  // Constructor to receive the transaction details.
  const TransactionConfirmationPage({
    super.key,
    required this.recipient,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Confirm Transaction')), // AppBar with page title.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content.
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left.
          children: [
            const Text(
              'Transaction Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ), // Heading text.
            const SizedBox(height: 16), // Spacer between heading and content.
            Text('Recipient: $recipient'), // Display recipient info.
            Text(
                'Amount: \$${amount.toStringAsFixed(2)}'), // Display amount with two decimals.
            Text(
                'Payment Method: $paymentMethod'), // Display selected payment method.
            const SizedBox(height: 20), // Spacer before buttons.

            // Confirm Button to process the transaction.
            CustomButton(
              text: 'Confirm and Send', // Button text.
              onPressed: () {
                // Process the transaction (e.g., send request to backend).
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Transaction Successful')), // Success message.
                );
                Navigator.popUntil(
                    context,
                    (route) =>
                        route.isFirst); // Navigate back to the Dashboard.
              },
            ),
            const SizedBox(height: 10), // Spacer between buttons.

            // Cancel Button to go back to the Send Money page.
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the Send Money page.
              },
              child: const Text('Cancel'), // Button text.
            ),
          ],
        ),
      ),
    );
  }
}

