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

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _currency = TextEditingController();
  double currencyRate = 0;
  String radioType = "MC";
  double discount = 0.0;
  double netRate = 0.0;

  bool ta = false;
  bool tb = false;
  double tourPrice = 0.0;

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
      body: SingleChildScrollView(
        child: Column(
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
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _currency,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money),
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  currencyRate = double.parse(_currency.text) * 2.6;
                });
              },
              child: Text('Convert'),
            ),
            Text(
              'OMR To USD : ' + currencyRate.toStringAsFixed(3),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Tour Discount : ' + netRate.toStringAsFixed(3)),
            ),
            RadioListTile(
                title: Text('Mmeber Customer'),
                value: "MC",
                groupValue: radioType,
                onChanged: (value) {
                  setState(() {
                    radioType = value.toString();
                    if ((_currency.text.isNotEmpty) &&
                        double.parse(_currency.text) != 0) {
                      discount = double.parse(_currency.text) * 0.5;
                      netRate = double.parse(_currency.text) - discount;
                    }
                  });
                }),
            RadioListTile(
                title: Text('Guest Customer'),
                value: "gc",
                groupValue: radioType,
                onChanged: (value) {
                  setState(() {
                    radioType = value.toString();
                    if ((_currency.text.isNotEmpty) &&
                        double.parse(_currency.text) != 0) {
                      discount = double.parse(_currency.text) * 0.1;
                      netRate = double.parse(_currency.text) - discount;
                    }
                  });
                }),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.amberAccent,
              child: Text(
                'Tours : ' + tourPrice.toStringAsFixed(3),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CheckboxListTile(
                title: Image(image: AssetImage('images/Salalah1.jpg')),
                value: ta,
                onChanged: (value) {
                  setState(() {
                    ta = value!;
                    if (ta) {
                      tourPrice += 50;
                    } else {
                      tourPrice -= 50;
                    }
                  });
                }),
            CheckboxListTile(
                title: Image(image: AssetImage('images/Salalah2.jpg')),
                value: tb,
                onChanged: (value) {
                  setState(() {
                    tb = value!;
                    if (tb) {
                      tourPrice += 50;
                    } else {
                      tourPrice -= 50;
                    }
                  });
                }),
          ],
        ),
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
