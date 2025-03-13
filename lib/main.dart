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
          Text(
            "Popular Places",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Image(
                        image: AssetImage('images/Salalah2.jpg'),
                      ),
                    ),
                    MyFav(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Image(
                        image: AssetImage('images/Salalah3.jpg'),
                      ),
                    ),
                    MyFav(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.indigoAccent,
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.lightGreen,
            child: Text(
              "Top Place",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            color: Colors.greenAccent,
            child: Image(
              image: AssetImage('images/Salalah4.jpg'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Test',
        backgroundColor: Colors.green[300],
        foregroundColor: Colors.white,
        child: Icon(
          Icons.home,
        ),
      ),
    );
  }
}

class MyFav extends StatefulWidget {
  const MyFav({super.key});

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => liked = !liked);
      },
      icon: liked
          ? (Icon(Icons.favorite, color: Colors.red))
          : (Icon(Icons.favorite)),
      //icon: Icon(Icons.favorite));
    );
  }
}
