import 'package:flutter/material.dart';

class VoiceComponent extends StatelessWidget {
  const VoiceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto GPT"),
      ),
      body: const Column(
        children: [
          Text("Hi, I am GenAI, You can give me input"),
          Text("either by voice or text"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              child: const Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
