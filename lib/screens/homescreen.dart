import 'package:flutter/material.dart';
import 'package:mystiquemusic/screens/player_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> songTitles = [
    'Song 1 - Artist A',
    'Song 2 - Artist B',
    'Song 3 - Artist C',
    'Song 4 - Artist D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Streaming App'),
      ),
      body: ListView.builder(
        itemCount: songTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songTitles[index]),
            onTap: () {
              // Navigate to the player screen when a song is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PlayerScreen(songTitle: songTitles[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
