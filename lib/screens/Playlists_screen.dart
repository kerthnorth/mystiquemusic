import 'package:flutter/material.dart';
import 'package:mystiquemusic/screens/player_screen.dart';

class PlaylistsScreen extends StatefulWidget {
  PlaylistsScreen({super.key});

  @override
  _PlaylistsScreenState createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  final List<String> playlists = [
    'Rock Classics',
    'Pop Hits',
    'Chill Vibes',
    'Workout Pump',
    'Jazz Essentials'
  ];

  void createNewPlaylist(BuildContext context) {
    TextEditingController playlistController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create New Playlist"),
          content: TextField(
            controller: playlistController,
            decoration: const InputDecoration(hintText: "Playlist Name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without creating
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (playlistController.text.isNotEmpty) {
                  setState(() {
                    playlists.add(playlistController.text); // Add playlist
                  });
                  Navigator.pop(context); // Close dialog after creating
                }
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Playlist"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(playlists[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerScreen(playlistName: playlists[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewPlaylist(context),
        child: const Icon(Icons.add),
        tooltip: "Create New Playlist",
      ),
    );
  }
}

class PlayerScreen extends StatelessWidget {
  final String playlistName;

  const PlayerScreen({Key? key, required this.playlistName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlistName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Now Playing: $playlistName',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
