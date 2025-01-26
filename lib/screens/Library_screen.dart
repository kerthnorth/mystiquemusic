import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Map<String, String>> songs = [
    {'title': 'Song 1', 'artist': 'Artist A'},
    {'title': 'Song 3', 'artist': 'Artist C'},
    {'title': 'Song 2', 'artist': 'Artist B'},
    {'title': 'Song 4', 'artist': 'Artist D'},
  ];

  String selectedSortOption = 'Name'; // Default sorting option

  void sortSongs(String option) {
    setState(() {
      if (option == 'Name') {
        songs.sort((a, b) => a['title']!.compareTo(b['title']!));
      } else if (option == 'Artist') {
        songs.sort((a, b) => a['artist']!.compareTo(b['artist']!));
      }
      selectedSortOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          DropdownButton<String>(
            value: selectedSortOption,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.sort, color: Colors.white),
            items: <String>['Name', 'Artist']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                sortSongs(value);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(songs[index]['title']!),
            subtitle: Text(songs[index]['artist']!),
          );
        },
      ),
    );
  }
}
