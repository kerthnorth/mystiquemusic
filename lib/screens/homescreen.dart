import 'package:flutter/material.dart';
import 'package:mystiquemusic/screens/player_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> songTitles = [
    'Song 1 - Artist A',
    'Song 2 - Artist B',
    'Song 3 - Artist C',
    'Song 4 - Artist D',
    // style: TextStyle(color: Colors.white, fontSize: 16),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mystique Music'),
      ),
      body: ListView.builder(
        itemCount: songTitles.length,

        itemBuilder: (context, index) {
          return ListTile(
            // colors: Text(color: ),
            leading: const Icon(color: Colors.white, Icons.music_note),
            title: Text(songTitles[index]),

            trailing: const Icon(color: Colors.white, Icons.play_arrow),
              // color: primaryText, fontSize: 24, fontWeight: FontWeight.bold),
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
