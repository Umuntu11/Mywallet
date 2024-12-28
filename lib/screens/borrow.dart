import 'package:flutter/material.dart';

class BorrowingScreen extends StatefulWidget {
  @override
  _BorrowingScreenState createState() => _BorrowingScreenState();
}

class _BorrowingScreenState extends State<BorrowingScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController lenderNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrow Money'),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: lenderNameController,
              decoration: InputDecoration(
                labelText: 'Lender Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Borrowing Date',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    dateController.text = pickedDate.toString().split(' ')[0];
                  });
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String amount = amountController.text.trim();
                String lenderName = lenderNameController.text.trim();
                String date = dateController.text.trim();

                if (amount.isEmpty || lenderName.isEmpty || date.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields')),
                  );
                } else {
                  // Process borrowing transaction
                  print('Borrowed Amount: $amount');
                  print('Lender Name: $lenderName');
                  print('Borrowing Date: $date');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Borrowing details saved')),
                  );
                  // Clear inputs after saving
                  amountController.clear();
                  lenderNameController.clear();
                  dateController.clear();
                }
              },
              child: Text('Save Borrowing Details'),
            ),
          ],
        ),
      ),
    );
  }
}
