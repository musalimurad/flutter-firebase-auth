import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseAuth auth;
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  firebaseRegister();
                },
                child: const Text("firebase register mail"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  firebaseLogin();
                },
                child: const Text("firebase login mail"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void firebaseRegister() async {
    try {
      var postUser = await auth.createUserWithEmailAndPassword(
          email: "muradmusali@codelandia.edu.az", password: "Murad!@123");

      debugPrint(postUser.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void firebaseLogin() async {
    try {
      var getUser = await auth.signInWithEmailAndPassword(
          email: "muradmusali@codelandia.edu.az", password: "Murad!@123");
      debugPrint(getUser.user.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
