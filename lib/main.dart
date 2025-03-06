import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tourism App",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 3.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.greenAccent,
              child: Image(
                image: AssetImage('images/Salalah1.jpg'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 200,
                    child: Image(
                      image: AssetImage('images/Salalah2.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 200,
                    child: Image(
                      image: AssetImage('images/Salalah3.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
