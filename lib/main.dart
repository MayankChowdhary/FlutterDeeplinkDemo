import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tab_share_app/ImagePost.dart';
import 'package:tab_share_app/TextPost.dart';
import 'package:tab_share_app/VideoPost.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAB Share',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tab Share App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    const VideoPost(videoUrl:  "https://videos.pexels.com/video-files/3403453/3403453-uhd_1440_2732_25fps.mp4"),
    const ImagePost(imageUrl:  "https://images-s.kinorium.com/movie/poster/528849/w1500_3020801.jpg"),
    const TextPost(),
  ];


  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _initDeepLinkListener()  {
       getInitialUri().then((value) =>
            _handleDeepLink(value!.path),
      );
  }

  void _handleDeepLink(String link) {
    var deepLink = link.substring(1,link.length);
    //showToast("Link: $deepLink");
      _onTabTapped(_getSelectedWidget(deepLink)); // Update the deep link value
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Length of the toast
      gravity: ToastGravity.BOTTOM, // Position of the toast
      timeInSecForIosWeb: 1, // Duration for iOS web
      backgroundColor: Colors.black, // Background color
      textColor: Colors.white, // Text color
      fontSize: 16.0, // Font size
    );
  }

  int _getSelectedWidget(String selectedItem) {
    switch (selectedItem) {
      case 'videopost':
        return 0;
      case 'imagepost':
        return 1;
      case 'textpost':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_back),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
        ],
      ),
    );
  }
}
