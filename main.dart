import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:s6/chat.dart';
import 'package:s6/url.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBBk2XtWT7bjZX57DZv9Y636ReCmaAtFu8",
      projectId: "svindo-a86c1",
      messagingSenderId: "227992860597",
      appId: "1:227992860597:web:74a5c77bdb84be8afa8bfc",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '227992860597-pjftmr5bmqu3okvu6m5qd529h9ptafav.apps.googleusercontent.com',
  );

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: userCredential.user!),
        ),
      );
    } catch (e) {
      print("Error during Google Sign-In: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final User user;

  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: LinkOpener()), // Home Page content

    Container(
      // Settings Page content
      color: Colors.blueGrey[50],
      child: Center(
        child: Text('Settings Page', style: TextStyle(fontSize: 18)),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ChatScreen(),
      ),
      appBar: AppBar(
        title: Text("${widget.user.displayName ?? "User"}"),
        actions: [
          IconButton(
            onPressed: () {
              FlutterPhoneDirectCaller.callNumber('+91 6301749679');
            },
            icon: Icon(Icons.call),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Developer',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
