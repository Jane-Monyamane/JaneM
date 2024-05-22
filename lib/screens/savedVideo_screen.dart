import 'package:flutter/material.dart';

class VideoItem {
  final String title;
  final String description;
  final String videoUrl;

  VideoItem({
    required this.title,
    required this.description,
    required this.videoUrl,
  });
}

class SavedVideoScreen extends StatelessWidget {
  final List<VideoItem> savedVideos = [
    VideoItem(
      title: "Video 1",
      description: "Description of Video 1",
      videoUrl: "",
    ),
    VideoItem(
      title: "Video 2",
      description: "Description of Video 2",
      videoUrl: "",
    ),
    // Add more video items as needed
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 179, 207),
        elevation: 0,
        title: const Text(
          "Saved Videos",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}