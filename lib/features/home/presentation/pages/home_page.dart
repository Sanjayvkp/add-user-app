import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'User App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
