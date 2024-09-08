import 'package:flutter/material.dart';
import 'package:myapp/connect/connect.dart';
import 'package:myapp/mint/mint.dart';
import 'package:myapp/screens/fourth.dart';
import 'package:myapp/screens/second.dart';
import 'package:myapp/screens/third.dart';
import 'package:myapp/screens/wallet.dart';
import 'package:myapp/screens/settings.dart' as Settings;

import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  String arg = const String.fromEnvironment('simple'); // arg = "example"

  // runApp(IDSafeApp());
  runApp(ProviderScope(child: IDSafeApp()));

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IDSafe'),
        backgroundColor: Colors.green,
      ),
      drawer: MediaQuery.of(context).size.width >= 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text(' Menu'),
                  ),
                  ListTile(
                    title: const Text('Connect'),
                    onTap: () {
                      // Handle navigation to home
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Info'),
                    onTap: () {
                      // Handle navigation to token

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Wallet'),
                    onTap: () {
                      // Handle navigation to info
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    onTap: () {
                      // Handle navigation to account
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings.SettingsPage()),
                      );



                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  'assets/logo.png',
                  width: 720,
                  height: 160,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                ' Connect Wallet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildInputField('Address', Icons.email),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: const Text('Connect'),
              ),
              const SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 600
          ? NavigationBar(
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.link),
                  label: 'Connect',
                ),
                NavigationDestination(
                  icon: Icon(Icons.info_sharp),
                  label: 'Info',
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle),
                  label: 'Wallet',
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle),
                  label: 'Settings',
                ),
              ],
            )
          : null,
    );
  }

  Widget _buildInputField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
}































// import 'package:flutter/material.dart';
// import 'package:myapp/connect/connect.dart';
// import 'package:myapp/mint/mint.dart';
// import 'package:myapp/screens/fourth.dart';
// import 'package:myapp/screens/second.dart';
// import 'package:myapp/screens/third.dart';

// void main() {
//   String arg = const String.fromEnvironment('simple'); // arg = "example"

//   runApp(IDSafeApp());
// }

// class IDSafeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'IDSafe',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         brightness: Brightness.dark,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IDSafe'),
//         backgroundColor: Colors.green,
//       ),
//       drawer: MediaQuery.of(context).size.width >= 600
//           ? Drawer(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   const DrawerHeader(
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                     ),
//                     child: Text(' Menu'),
//                   ),
//                   ListTile(
//                     title: const Text('Home'),
//                     onTap: () {
//                       // Handle navigation to home
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('Token'),
//                     onTap: () {
//                       // Handle navigation to token

//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('Info'),
//                     onTap: () {
//                       // Handle navigation to info
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     title: const Text('Account'),
//                     onTap: () {
//                       // Handle navigation to account
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             )
//           : null,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FadeTransition(
//                 opacity: _animation,
//                 child: Image.asset(
//                   'assets/logo.png',
//                   width: 720,
//                   height: 160,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 ' Connect Wallet',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               _buildInputField('Address', Icons.email),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle form submission
//                 },
//                 child: Text('Connect'),
//               ),
//               SizedBox(height: 20),
//               _buildLinkCard(
//                 'Docs',
//                 'Find in-depth information about IDSafe features and API.',
//                 'https://nextjs.org/docs',
//               ),
//               _buildLinkCard(
//                 'Learn',
//                 'Learn how to protect your privacy with IDSafe in an interactive course with quizzes!',
//                 'https://nextjs.org/learn',
//               ),
//               _buildLinkCard(
//                 'Templates',
//                 'Explore starter templates for IDSafe connections.',
//                 'https://vercel.com/templates',
//               ),
//               _buildLinkCard(
//                 'Deploy',
//                 'Instantly deploy your Application with IDSafe SDK.',
//                 'https://vercel.com/new',
//               ),
//               if (MediaQuery.of(context).size.width < 600)
//                 NavigationBar(
//                   destinations: [
//                     NavigationDestination(
//                       icon: Icon(Icons.home),
//                       label: 'Home',
//                     ),

// // Cut out continuation.

//                     NavigationDestination(
//                       icon: Icon(Icons.token),
//                       label: 'Token',
//                     ),
//                     NavigationDestination(
//                       icon: Icon(Icons.info),
//                       label: 'Info',
//                     ),
//                     NavigationDestination(
//                       icon: Icon(Icons.account_circle),
//                       label: 'Account',
//                     ),
//                   ],
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(String label, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLinkCard(String title, String description, String url) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: InkWell(
//         onTap: () {
//           // Handle link tap
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: TextStyle(fontSize: 16, color: Colors.green[400]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






























































// import 'package:flutter/material.dart';

// void main() {

//   String arg = const String.fromEnvironment('simple'); // arg = "example"

//   runApp(IDSafeApp());
// }

// class IDSafeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'IDSafe',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         brightness: Brightness.dark,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IDSafe'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FadeTransition(
//                 opacity: _animation,
//                 child: Image.asset(
//                   'assets/logo.png',
//                   width: 720,
//                   height: 160,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 ' Mint NFT',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               // _buildInputField('First-Name', Icons.person),
//               // _buildInputField('Second-Name', Icons.person),
//               // _buildInputField('Last-Name', Icons.person),
//               _buildInputField('Address', Icons.email),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle form submission
//                 },
//                 child: Text('Connect'),
//               ),
//               SizedBox(height: 20),
//               _buildLinkCard(
//                 'Docs',
//                 'Find in-depth information about IDSafe features and API.',
//                 'https://nextjs.org/docs',
//               ),
//               _buildLinkCard(
//                 'Learn',
//                 'Learn how to protect your privacy with IDSafe in an interactive course with quizzes!',
//                 'https://nextjs.org/learn',
//               ),
//               _buildLinkCard(
//                 'Templates',
//                 'Explore starter templates for IDSafe connections.',
//                 'https://vercel.com/templates',
//               ),
//               _buildLinkCard(
//                 'Deploy',
//                 'Instantly deploy your Application with IDSafe SDK.',
//                 'https://vercel.com/new',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField(String label, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLinkCard(String title, String description, String url) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: InkWell(
//         onTap: () {
//           // Handle link tap
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: TextStyle(fontSize: 16, color: Colors.green[400]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








// import 'package:myapp/main.dart';

// void main() {
//   runApp(ProviderScope(child: IDSafeApp()));
// }

// class IDSafeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'IDSafe',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         brightness: Brightness.dark,
//       ),
//       home: HomePage(),
//     );
//   }
// }
