import 'package:flutter/material.dart';

import '../Edit Profile/edit_profile.dart';
import '../Help/help.dart';
import '../Logout/logout.dart';
import '../Security/security.dart';
import '../Settings/Settings.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          const SizedBox(height: 60),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    child: Icon(Icons.notifications_none, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Body Container
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Smith",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "ID: 25030024",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),

                  _buildProfileOption(
                    context,
                    icon: Icons.person_outline,
                    title: 'Edit Profile',
                    destination: const EditProfile(),
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.security_outlined,
                    title: 'Security',
                    destination: const Security(),
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Setting',
                    destination: const Settings(),
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help',
                    destination: const Help(),
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    destination: const Logout(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Modified: Accepts context and destination screen
  Widget _buildProfileOption(BuildContext context,
      {required IconData icon, required String title, required Widget destination}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE0F0FF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
