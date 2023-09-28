import 'package:flutter/material.dart';
import 'package:tugas3/sidemenu.dart';


class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Khalimah Musaadah'),
            SizedBox(height: 10),
            Text('H1D021001'),
          ],
        )
      ),
      drawer: const Sidemenu(),
    );
  }
}