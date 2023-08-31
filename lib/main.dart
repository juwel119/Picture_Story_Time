import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PictureStoryPage(),
    );
  }
}

class PictureStoryPage extends StatefulWidget {
  @override
  _PictureStoryPageState createState() => _PictureStoryPageState();
}

class _PictureStoryPageState extends State<PictureStoryPage> {
  int currentPart = 0;

  final List<String> storyImages = [
    'assets/56684.jpg',
    'assets/IMG_20200307_160754.jpg',
    'assets/56684.jpg',
    'assets/IMG_20200307_160754.jpg',
    // Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Story Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: storyImages[currentPart],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (currentPart > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentPart--;
                      });
                    },
                    child: Text('Previous'),
                  ),
                if (currentPart < storyImages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentPart++;
                      });
                    },
                    child: Text('Next'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
