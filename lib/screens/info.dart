import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        title: const Text('Info'),
        backgroundColor: Colors.green,

         leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        
      ),




      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLinkCard(
                'Docs',
                'Find in-depth information about IDSafe features and API.',
                'https://nextjs.org/docs',
              ),
              _buildLinkCard(
                'Learn',
                'Learn how to protect your privacy with IDSafe in an interactive course with quizzes!',
                'https://nextjs.org/learn',
              ),
              _buildLinkCard(
                'Templates',
                'Explore starter templates for IDSafe connections.',
                'https://vercel.com/templates',
              ),
              _buildLinkCard(
                'Deploy',
                'Instantly deploy your Application with IDSafe SDK.',
                'https://vercel.com/new',
              ),
              const SizedBox(height: 20),
              const Text(
                'Other Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildInfoCard('FAQ', 'Frequently Asked Questions', Icons.question_answer),
              _buildInfoCard('Privacy Policy', 'Read our privacy policy', Icons.privacy_tip),
              _buildInfoCard('Open Source Licenses', 'View open source licenses', Icons.code),
              _buildInfoCard('Source Code', 'View the source code on GitHub', Icons.code),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLinkCard(String title, String description, String url) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          // Handle link tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.green[400]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16, color: Colors.green[400])),
        onTap: () {
          // Handle info card tap
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'IDSafe Info',
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    home: InfoPage(),
  ));
}