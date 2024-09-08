import 'package:flutter/material.dart';

void main() {
  runApp(IDSafeApp());
}

class IDSafeApp extends StatelessWidget {
  const IDSafeApp({super.key});

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
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
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
            const Text(
              'Total Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  '\$12,345.67',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    // Handle refresh balance
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle send
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Send'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle add crypto
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Add Crypto'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle exchange
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Exchange'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle P2P market
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('P2P Market'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Notifications Panel
            Card(
              color: Colors.green[100],
              child: const Padding(
                padding: EdgeInsets.all(16.0),
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
            const SizedBox(height: 20),
            // List of Tokens
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual number of tokens
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.monetization_on),
                      title: Text('Token ${index + 1}'),
                      subtitle: const Text('Balance: 123.45'),
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