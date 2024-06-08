import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LiveFeedScreen extends StatefulWidget {
  const LiveFeedScreen({Key? key}) : super(key: key);

  @override
  _LiveFeedScreenState createState() => _LiveFeedScreenState();
}

class _LiveFeedScreenState extends State<LiveFeedScreen> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _fetchImageUrls();
  }

  Future<void> _fetchImageUrls() async {
    try {
      // Use the correct reference to your Firebase Storage bucket
      firebase_storage.ListResult result = await firebase_storage.FirebaseStorage.instance
          .ref()
          .child('my-app-a0341.appspot.com')
          .listAll();


      List<String> urls = await Future.wait(result.items.map((firebase_storage.Reference ref) async {
        return await ref.getDownloadURL();
      }).toList());

      setState(() {
        _imageUrls = urls;
      });
    } catch (e) {
      print('Error fetching image URLs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Feed'),
        backgroundColor: Colors.blue[100],
      ),
      body: _imageUrls.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(_imageUrls[index]);
              },
            ),
    );
  }
}
