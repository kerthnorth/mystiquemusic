import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String songTitle;
  const PlayerScreen({super.key, required this.songTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.music_note,
              size: 120,
              color: Colors.blue.shade600,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Song is playing...',
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Basic controls for design (no functionality yet)
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 64,
              onPressed: () {
                // Placeholder for play functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Play button clicked')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 64,
              onPressed: () {
                // Placeholder for pause functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pause button clicked')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              iconSize: 64,
              onPressed: () {
                // Placeholder for skip functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Skip button clicked')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
