import 'package:flutter/material.dart';
import 'package:mystiquemusic/screens/Library_screen.dart';
import 'package:mystiquemusic/screens/player_screen.dart';
import 'package:mystiquemusic/screens/Playlists_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> songTitles = [
    'Song 1 - Artist A',
    'Song 2 - Artist B',
    'Song 3 - Artist C',
    'Song 4 - Artist D',
  ];

  final List<String> favorites = [];
  final List<String> playlists = ['Favorites'];

  void addToFavorites(String song) {
    if (!favorites.contains(song)) {
      setState(() {
        favorites.add(song);
      });
    }
  }

  void navigateWithAnimation(BuildContext context, String songTitle) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PlayerScreen(songTitle: songTitle),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.queue_music),
              title: const Text('Playlists'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaylistsScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.library_music),
              title: const Text('Library'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LibraryScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            ...playlists.map((playlist) {
              return ListTile(
                leading: const Icon(Icons.library_music),
                title: Text(playlist),
                onTap: () {
                  // Handle playlist selection logic here
                },
              );
            }).toList(), // Fixed syntax: Added `.toList()`
            const Divider(),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: songTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              favorites.contains(songTitles[index])
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favorites.contains(songTitles[index]) ? Colors.red : null,
            ),
            title: Text(
              songTitles[index],
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.play_arrow),
            onTap: () {
              // Add to favorites and navigate with animation
              addToFavorites(songTitles[index]);
              navigateWithAnimation(context, songTitles[index]);
            },
          );
        },
      ),
    );
  }
}

class PlayerScreen extends StatelessWidget {
  final String songTitle;

  const PlayerScreen({Key? key, required this.songTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Playing: $songTitle',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
