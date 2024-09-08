import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/main.dart';


class SettingsPage extends ConsumerStatefulWidget {
  final String? walletString;

  const SettingsPage({super.key, this.walletString});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedWallet = 'default';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    if (widget.walletString != null) {
      selectedWallet = widget.walletString!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
        actions: [
          DropdownButton<String>(
            value: selectedWallet,
            dropdownColor: Colors.green,
            items: <String>['default', 'new wallet']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue == 'new wallet') {
                _showNewWalletOptions(context);
              } else {
                setState(() {
                  selectedWallet = newValue!;
                });
              }
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Wallet'),
            Tab(text: 'NFT'),
            Tab(text: 'Backup'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          WalletSettings(),
          NFTSettings(),
          BackupSettings(),
        ],
      ),
    );
  }

  void _showNewWalletOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Wallet'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Create Wallet'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to create wallet page
                },
              ),
              ListTile(
                title: const Text('Connect Wallet'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class WalletSettings extends ConsumerWidget {
  const WalletSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          title: const Text('Choose Chains/Network'),
          subtitle: const Text('Default: Arbitrium'),
          onTap: () {
            // Navigate to chains/network page
          },
        ),
        SwitchListTile(
          title: const Text('Allow Testnets'),
          // value: ref.watch(testnetsProvider).state,
          value: ref.watch(testnetsProvider),
          onChanged: (bool value) {
            ref.read(testnetsProvider.notifier).state = value;
          },
        ),
        SwitchListTile(
          title: const Text('Allow External Connections'),
          // value: ref.watch(externalConnectionsProvider).state,
          value: ref.watch(externalConnectionsProvider),
          onChanged: (bool value) {
            ref.read(externalConnectionsProvider.notifier).state = value;
          },
        ),
        SwitchListTile(
          title: const Text('Listen for Connection Requests'),
          // value: ref.watch(connectionRequestsProvider).state,
          value: ref.watch(connectionRequestsProvider),
          onChanged: (bool value) {
            ref.read(connectionRequestsProvider.notifier).state = value;
          },
        ),
        SwitchListTile(
          title: const Text('Notifications'),
          // value: ref.watch(notificationsProvider).state,
          value: ref.watch(notificationsProvider),
          onChanged: (bool value) {
            ref.read(notificationsProvider.notifier).state = value;
          },
        ),
        ListTile(
          title: const Text('Wallet Language'),
          onTap: () {
            // Navigate to language settings page
          },
        ),
        SwitchListTile(
          title: const Text('Biometric Unlock'),
          // value: ref.watch(biometricUnlockProvider).state,
          value: ref.watch(biometricUnlockProvider),
          onChanged: (bool value) {
            ref.read(biometricUnlockProvider.notifier).state = value;
          },
        ),
        ListTile(
          title: const Text('Add Device Passkey'),
          onTap: () {
            // Navigate to add device passkey page
          },
        ),
        ListTile(
          title: const Text('Default Currency'),
          onTap: () {
            // Navigate to default currency page
          },
        ),
        SwitchListTile(
          title: const Text('Expand Assets'),
          // value: ref.watch(expandAssetsProvider).state,
          value: ref.watch(expandAssetsProvider),
          onChanged: (bool value) {
            ref.read(expandAssetsProvider.notifier).state = value;
          },
        ),
        ListTile(
          title: const Text('IDSafe FAQ'),
          onTap: () {
            // Navigate to FAQ page
          },
        ),
      ],
    );
  }
}

class NFTSettings extends ConsumerWidget {
  const NFTSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        SwitchListTile(
          title: const Text('Allow Minting NFTs'),
          // value: ref.watch(mintingNFTsProvider).state,
          value: ref.watch(mintingNFTsProvider),
          onChanged: (bool value) {
            ref.read(mintingNFTsProvider.notifier).state = value;
          },
        ),
        SwitchListTile(
          title: const Text('Enable NFT Scanning'),
          // value: ref.watch(nftScanningProvider).state,
          value: ref.watch(nftScanningProvider),

          onChanged: (bool value) {
            ref.read(nftScanningProvider.notifier).state = value;
          },
        ),
        SwitchListTile(
          title: const Text('Enable NFC'),
          // value: ref.watch(nfcProvider).state,
          value: ref.watch(nfcProvider),
          onChanged: (bool value) {
            ref.read(nfcProvider.notifier).state = value;
          },
        ),
      ],
    );
  }
}

class BackupSettings extends ConsumerWidget {
  const BackupSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        SwitchListTile(
          title: const Text('Turn on Backup'),
          // value: ref.watch(backupProvider).state,
          value: ref.watch(backupProvider),
          onChanged: (bool value) {
            ref.read(backupProvider.notifier).state = value;
          },
        ),
        // if (ref.watch(backupProvider).state) ...[
        if (ref.watch(backupProvider)) ...[
          ListTile(
            title: const Text('Local Backup'),
            onTap: () {
              // Navigate to local backup settings page
            },
          ),
          ListTile(
            title: const Text('Backup to Google Drive'),
            onTap: () {
              // Navigate to Google Drive backup settings page
            },
          ),
        ],
      ],
    );
  }
}

// Riverpod Providers for State Management
final testnetsProvider = StateProvider<bool>((ref) => false);
final externalConnectionsProvider = StateProvider<bool>((ref) => false);
final connectionRequestsProvider = StateProvider<bool>((ref) => false);
final notificationsProvider = StateProvider<bool>((ref) => false);
final biometricUnlockProvider = StateProvider<bool>((ref) => false);
final expandAssetsProvider = StateProvider<bool>((ref) => false);
final mintingNFTsProvider = StateProvider<bool>((ref) => false);
final nftScanningProvider = StateProvider<bool>((ref) => false);
final nfcProvider = StateProvider<bool>((ref) => false);
final backupProvider = StateProvider<bool>((ref) => false);












































// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IDSafe'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SettingsPage()),
//             );
//           },
//           child: Text('Go to Settings'),
//         ),
//       ),
//     );
//   }
// }

// class SettingsPage extends ConsumerStatefulWidget {
//   final String? walletString;

//   SettingsPage({this.walletString});

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends ConsumerState<SettingsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String selectedWallet = 'default';

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     if (widget.walletString != null) {
//       selectedWallet = widget.walletString!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//         backgroundColor: Colors.green,
//         actions: [
//           DropdownButton<String>(
//             value: selectedWallet,
//             dropdownColor: Colors.green,
//             items: <String>['default', 'new wallet']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               if (newValue == 'new wallet') {
//                 _showNewWalletOptions(context);
//               } else {
//                 setState(() {
//                   selectedWallet = newValue!;
//                 });
//               }
//             },
//           ),
//         ],
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Wallet'),
//             Tab(text: 'NFT'),
//             Tab(text: 'Backup'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           WalletSettings(),
//           NFTSettings(),
//           BackupSettings(),
//         ],
//       ),
//     );
//   }

//   void _showNewWalletOptions(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('New Wallet'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('Create Wallet'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   // Navigate to create wallet page
//                 },
//               ),
//               ListTile(
//                 title: Text('Connect Wallet'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class WalletSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         ListTile(
//           title: Text('Choose Chains/Network'),
//           subtitle: Text('Default: Arbitrium'),
//           onTap: () {
//             // Navigate to chains/network page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Allow Testnets'),
//           value: watch(testnetsProvider).state,
//           onChanged: (bool value) {
//             context.read(testnetsProvider.notifier).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Allow External Connections'),
//           value: watch(externalConnectionsProvider).state,
//           onChanged: (bool value) {
//             context.read(externalConnectionsProvider.notifier).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Listen for Connection Requests'),
//           value: watch(connectionRequestsProvider).state,
//           onChanged: (bool value) {
//             context.read(connectionRequestsProvider.notifier).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Notifications'),
//           value: watch(notificationsProvider).state,
//           onChanged: (bool value) {
//             context.read(notificationsProvider.notifier).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('Wallet Language'),
//           onTap: () {
//             // Navigate to language settings page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Biometric Unlock'),
//           value: watch(biometricUnlockProvider).state,
//           onChanged: (bool value) {
//             context.read(biometricUnlockProvider.notifier).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('Add Device Passkey'),
//           onTap: () {
//             // Navigate to add device passkey page
//           },
//         ),
//         ListTile(
//           title: Text('Default Currency'),
//           onTap: () {
//             // Navigate to default currency page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Expand Assets'),
//           value: watch(expandAssetsProvider).state,
//           onChanged: (bool value) {
//             context.read(expandAssetsProvider.notifier).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('IDSafe FAQ'),
//           onTap: () {
//             // Navigate to FAQ page
//           },
//         ),
//       ],
//     );
//   }
// }

// class NFTSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         SwitchListTile(
//           title: Text('Allow Minting NFTs'),
//           value: watch(mintingNFTsProvider).state,
//           onChanged: (bool value) {
//             context.read(mintingNFTsProvider.notifier).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Enable NFT Scanning'),
//           value: watch(nftScanningProvider).state,
//           onChanged: (bool value) {
//             context.read(nftScanningProvider.notifier).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Enable NFC'),
//           value: watch(nfcProvider).state,
//           onChanged: (bool value) {
//             context.read(nfcProvider.notifier).state = value;
//           },
//         ),
//       ],
//     );
//   }
// }

// class BackupSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         SwitchListTile(
//           title: Text('Turn on Backup'),
//           value: watch(backupProvider).state,
//           onChanged: (bool value) {
//             context.read(backupProvider.notifier).state = value;
//           },
//         ),
//         if (watch(backupProvider).state) ...[
//           ListTile(
//             title: Text('Local Backup'),
//             onTap: () {
//               // Navigate to local backup settings page
//             },
//           ),
//           ListTile(
//             title: Text('Backup to Google Drive'),
//             onTap: () {
//               // Navigate to Google Drive backup settings page
//             },
//           ),
//         ],
//       ],
//     );
//   }
// }

// // Riverpod Providers for State Management
// final testnetsProvider = StateProvider<bool>((ref) => false);
// final externalConnectionsProvider = StateProvider<bool>((ref) => false);
// final connectionRequestsProvider = StateProvider<bool>((ref) => false);
// final notificationsProvider = StateProvider<bool>((ref) => false);
// final biometricUnlockProvider = StateProvider<bool>((ref) => false);
// final expandAssetsProvider = StateProvider<bool>((ref) => false);
// final mintingNFTsProvider = StateProvider<bool>((ref) => false);
// final nftScanningProvider = StateProvider<bool>((ref) => false);
// final nfcProvider = StateProvider<bool>((ref) => false);
// final backupProvider = StateProvider<bool>((ref) => false);








































// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IDSafe'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SettingsPage()),
//             );
//           },
//           child: Text('Go to Settings'),
//         ),
//       ),
//     );
//   }
// }

// class SettingsPage extends ConsumerStatefulWidget {
//   final String? walletString;

//   SettingsPage({this.walletString});

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends ConsumerState<SettingsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String selectedWallet = 'default';

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     if (widget.walletString != null) {
//       selectedWallet = widget.walletString!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//         backgroundColor: Colors.green,
//         actions: [
//           DropdownButton<String>(
//             value: selectedWallet,
//             dropdownColor: Colors.green,
//             items: <String>['default', 'new wallet']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               if (newValue == 'new wallet') {
//                 _showNewWalletOptions(context);
//               } else {
//                 setState(() {
//                   selectedWallet = newValue!;
//                 });
//               }
//             },
//           ),
//         ],
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Wallet'),
//             Tab(text: 'NFT'),
//             Tab(text: 'Backup'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           WalletSettings(),
//           NFTSettings(),
//           BackupSettings(),
//         ],
//       ),
//     );
//   }

//   void _showNewWalletOptions(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('New Wallet'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('Create Wallet'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   // Navigate to create wallet page
//                 },
//               ),
//               ListTile(
//                 title: Text('Connect Wallet'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class WalletSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         ListTile(
//           title: Text('Choose Chains/Network'),
//           subtitle: Text('Default: Arbitrium'),
//           onTap: () {
//             // Navigate to chains/network page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Allow Testnets'),
//           value: watch(testnetsProvider).state,
//           onChanged: (bool value) {
//             context.read(testnetsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Allow External Connections'),
//           value: watch(externalConnectionsProvider).state,
//           onChanged: (bool value) {
//             context.read(externalConnectionsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Listen for Connection Requests'),
//           value: watch(connectionRequestsProvider).state,
//           onChanged: (bool value) {
//             context.read(connectionRequestsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Notifications'),
//           value: watch(notificationsProvider).state,
//           onChanged: (bool value) {
//             context.read(notificationsProvider).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('Wallet Language'),
//           onTap: () {
//             // Navigate to language settings page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Biometric Unlock'),
//           value: watch(biometricUnlockProvider).state,
//           onChanged: (bool value) {
//             context.read(biometricUnlockProvider).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('Add Device Passkey'),
//           onTap: () {
//             // Navigate to add device passkey page
//           },
//         ),
//         ListTile(
//           title: Text('Default Currency'),
//           onTap: () {
//             // Navigate to default currency page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Expand Assets'),
//           value: watch(expandAssetsProvider).state,
//           onChanged: (bool value) {
//             context.read(expandAssetsProvider).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('IDSafe FAQ'),
//           onTap: () {
//             // Navigate to FAQ page
//           },
//         ),
//       ],
//     );
//   }
// }

// class NFTSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         SwitchListTile(
//           title: Text('Allow Minting NFTs'),
//           value: watch(mintingNFTsProvider).state,
//           onChanged: (bool value) {
//             context.read(mintingNFTsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Enable NFT Scanning'),
//           value: watch(nftScanningProvider).state,
//           onChanged: (bool value) {
//             context.read(nftScanningProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Enable NFC'),
//           value: watch(nfcProvider).state,
//           onChanged: (bool value) {
//             context.read(nfcProvider).state = value;
//           },
//         ),
//       ],
//     );
//   }
// }

// class BackupSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         SwitchListTile(
//           title: Text('Turn on Backup'),
//           value: watch(backupProvider).state,
//           onChanged: (bool value) {
//             context.read(backupProvider).state = value;
//           },
//         ),
//         if (watch(backupProvider).state) ...[
//           ListTile(
//             title: Text('Local Backup'),
//             onTap: () {
//               // Navigate to local backup settings page
//             },
//           ),
//           ListTile(
//             title: Text('Backup to Google Drive'),
//             onTap: () {
//               // Navigate to Google Drive backup settings page
//             },
//           ),
//         ],
//       ],
//     );
//   }
// }

// // Riverpod Providers for State Management
// final testnetsProvider = StateProvider<bool>((ref) => false);
// final externalConnectionsProvider = StateProvider<bool>((ref) => false);
// final connectionRequestsProvider = StateProvider<bool>((ref) => false);
// final notificationsProvider = StateProvider<bool>((ref) => false);
// final biometricUnlockProvider = StateProvider<bool>((ref) => false);
// final expandAssetsProvider = StateProvider<bool>((ref) => false);
// final mintingNFTsProvider = StateProvider<bool>((ref) => false);
// final nftScanningProvider = StateProvider<bool>((ref) => false);
// final nfcProvider = StateProvider<bool>((ref) => false);
// final backupProvider = StateProvider<bool>((ref) => false);




































// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:riverpod/riverpod.dart';


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

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IDSafe'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SettingsPage()),
//             );
//           },
//           child: Text('Go to Settings'),
//         ),
//       ),
//     );
//   }
// }

// class SettingsPage extends ConsumerStatefulWidget {
//   final String? walletString;

//   SettingsPage({this.walletString});

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends ConsumerState<SettingsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String selectedWallet = 'default';

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     if (widget.walletString != null) {
//       selectedWallet = widget.walletString!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//         backgroundColor: Colors.green,
//         actions: [
//           DropdownButton<String>(
//             value: selectedWallet,
//             dropdownColor: Colors.green,
//             items: <String>['default', 'new wallet']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               if (newValue == 'new wallet') {
//                 _showNewWalletOptions(context);
//               } else {
//                 setState(() {
//                   selectedWallet = newValue!;
//                 });
//               }
//             },
//           ),
//         ],
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Wallet'),
//             Tab(text: 'NFT'),
//             Tab(text: 'Backup'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           WalletSettings(),
//           NFTSettings(),
//           BackupSettings(),
//         ],
//       ),
//     );
//   }

//   void _showNewWalletOptions(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('New Wallet'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('Create Wallet'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   // Navigate to create wallet page
//                 },
//               ),
//               ListTile(
//                 title: Text('Connect Wallet'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class WalletSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         ListTile(
//           title: Text('Choose Chains/Network'),
//           subtitle: Text('Default: Arbitrium'),
//           onTap: () {
//             // Navigate to chains/network page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Allow Testnets'),
//           value: watch(testnetsProvider).state,
//           onChanged: (bool value) {
//             context.read(testnetsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Allow External Connections'),
//           value: watch(externalConnectionsProvider).state,
//           onChanged: (bool value) {
//             context.read(externalConnectionsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Listen for Connection Requests'),
//           value: watch(connectionRequestsProvider).state,
//           onChanged: (bool value) {
//             context.read(connectionRequestsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Notifications'),
//           value: watch(notificationsProvider).state,
//           onChanged: (bool value) {
//             context.read(notificationsProvider).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('Wallet Language'),
//           onTap: () {
//             // Navigate to language settings page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Biometric Unlock'),
//           value: watch(biometricUnlockProvider).state,
//           onChanged: (bool value) {
//             context.read(biometricUnlockProvider).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('Add Device Passkey'),
//           onTap: () {
//             // Navigate to add device passkey page
//           },
//         ),
//         ListTile(
//           title: Text('Default Currency'),
//           onTap: () {
//             // Navigate to default currency page
//           },
//         ),
//         SwitchListTile(
//           title: Text('Expand Assets'),
//           value: watch(expandAssetsProvider).state,
//           onChanged: (bool value) {
//             context.read(expandAssetsProvider).state = value;
//           },
//         ),
//         ListTile(
//           title: Text('IDSafe FAQ'),
//           onTap: () {
//             // Navigate to FAQ page
//           },
//         ),
//       ],
//     );
//   }
// }

// class NFTSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         SwitchListTile(
//           title: Text('Allow Minting NFTs'),
//           value: watch(mintingNFTsProvider).state,
//           onChanged: (bool value) {
//             context.read(mintingNFTsProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Enable NFT Scanning'),
//           value: watch(nftScanningProvider).state,
//           onChanged: (bool value) {
//             context.read(nftScanningProvider).state = value;
//           },
//         ),
//         SwitchListTile(
//           title: Text('Enable NFC'),
//           value: watch(nfcProvider).state,
//           onChanged: (bool value) {
//             context.read(nfcProvider).state = value;
//           },
//         ),
//       ],
//     );
//   }
// }

// class BackupSettings extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     return ListView(
//       padding: EdgeInsets.all(16.0),
//       children: [
//         SwitchListTile(
//           title: Text('Turn on Backup'),
//           value: watch(backupProvider).state,
//           onChanged: (bool value) {
//             context.read(backupProvider).state = value;
//           },
//         ),
//         if (watch(backupProvider).state) ...[
//           ListTile(
//             title: Text('Local Backup'),
//             onTap: () {
//               // Navigate to local backup settings page
//             },
//           ),
//           ListTile(
//             title: Text('Backup to Google Drive'),
//             onTap: () {
//               // Navigate to Google Drive backup settings page
//             },
//           ),
//         ],
//       ],
//     );
//   }
// }

// // Riverpod Providers for State Management
// final testnetsProvider = StateProvider<bool>((ref) => false);
// final externalConnectionsProvider = StateProvider<bool>((ref) => false);
// final connectionRequestsProvider = StateProvider<bool>((ref) => false);
// final notificationsProvider = StateProvider<bool>((ref) => false);
// final biometricUnlockProvider = StateProvider<bool>((ref) => false);
// final expandAssetsProvider = StateProvider<bool>((ref) => false);
// final mintingNFTsProvider = StateProvider<bool>((ref) => false);
// final nftScanningProvider = StateProvider<bool>((ref) => false);
// final nfcProvider = StateProvider<bool>((ref) => false);
// final backupProvider = StateProvider<bool>((ref) => false);






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

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IDSafe'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SettingsPage()),
//             );
//           },
//           child: Text('Go to Settings'),
//         ),
//       ),
//     );
//   }
// }