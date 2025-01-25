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
        title: const Text('Mystique Music'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.queue_music),
              title: const Text('Playlists'),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.library_music),
              title: const Text('Library'),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: songTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note, color: Colors.white),
            title: Text(
              songTitles[index],
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Icon(Icons.play_arrow, color: Colors.white),
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
