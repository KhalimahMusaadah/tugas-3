// 

import 'package:flutter/material.dart';
import 'package:tugas3/about_page.dart';
import 'package:tugas3/schedule.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Khalim"), 
            decoration: BoxDecoration(
              color: Colors.blue, 
            ), accountEmail: null,
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.blue),
            title: const Text('MySchedule', style: TextStyle(color: Colors.blue)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Schedule()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: const Text('About', style: TextStyle(color: Colors.blue)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
