import 'package:flutter/material.dart';

void main() {
  runApp(IDSafeApp());
}

class IDSafeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDSafe',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Balance
            Text(
              'Total Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '\$12,345.67',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    // Handle refresh balance
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle send
                  },
                  child: Text('Send'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle add crypto
                  },
                  child: Text('Add Crypto'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle exchange
                  },
                  child: Text('Exchange'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle P2P market
                  },
                  child: Text('P2P Market'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Notifications Panel
            Card(
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('No new notifications'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // List of Tokens
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual number of tokens
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text('Token ${index + 1}'),
                      subtitle: Text('Balance: 123.45'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}