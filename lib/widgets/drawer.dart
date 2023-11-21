import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se_lab/classes/user_model.dart';

class MyDrawer extends StatelessWidget {
  final User? user;
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuItem2Tap;
  final VoidCallback? onMenuItem3Tap;
  final VoidCallback? onMenuItem4Tap;
  final VoidCallback? onMenuItem5Tap;
  final VoidCallback? onMenuItem6Tap;
  final VoidCallback? onMenuItem7Tap;

  MyDrawer({required this.user, this.onProfileTap, this.onMenuItem2Tap, this.onMenuItem3Tap, this.onMenuItem4Tap, 
  this.onMenuItem5Tap,this.onMenuItem6Tap,this.onMenuItem7Tap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade900,
            ),
            accountName: Text(user?.displayName ?? ""), // Display name of the user
            accountEmail: Text(user?.email ?? ""), // Email of the user
            currentAccountPicture: const CircleAvatar( 
              radius: 50.0,             
              child: Icon(Icons.person), // Placeholder icon if no profile picture
            ),         
          ),
          ListTile(
            title: Text("Add Flight"),
            onTap: () {
              if (onProfileTap != null) {
                onProfileTap!();
              }
            },
          ),
          ListTile(
            title: Text("View Flight"),
            onTap: () {
              if (onMenuItem2Tap != null) {
                onMenuItem2Tap!();
              }
            },
          ),
          ListTile(
            title: Text("Add Seat"),
            onTap: () {
              if (onMenuItem3Tap != null) {
                onMenuItem3Tap!();
              }
            },
          ),
          ListTile(
            title: Text("View Seat"),
            onTap: () {
              if (onMenuItem4Tap != null) {
                onMenuItem4Tap!();
              }
            },
          ),
          ListTile(
            title: Text("Offers"),
            onTap: () {
              if (onMenuItem5Tap != null) {
                onMenuItem5Tap!();
              }
            },
          ),
          ListTile(
            title: Text("Add Baggage"),
            onTap: () {
              if (onMenuItem6Tap != null) {
                onMenuItem6Tap!();
              }
            },
          ),
          ListTile(
            title: Text("View Baggage"),
            onTap: () {
              if (onMenuItem7Tap != null) {
                onMenuItem7Tap!();
              }
            },
          ),
          // Add more menu items as needed
        ],
      ),
    );
  }
}

