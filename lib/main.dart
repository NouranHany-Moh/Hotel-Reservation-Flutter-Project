import 'package:flutter/material.dart';
import 'package:hotel_reservation/CustomAppBar.dart';
import 'CustomAppBar.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'HomePage.dart';

void main() {
  runApp((MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DynaPuff'),
      home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  String checked_view = "Garden View";
  List<String>? checked;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date1) {
      setState(() {
        date1 = picked;
        print(date1.toString());
      });
    }
  }

  double rating_adults = 0.0;
  double rating_children = 0.0;

  Future<Null> selectcheckoutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(date1.year),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date1) {
      setState(() {
        date2 = picked;
        print(date2.toString());
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
                child: CustomAppBar(), preferredSize: Size.fromHeight(100)),
            body: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: ListView(children: [
                  Image.asset(
                    "images/maini.jpg",
                    height: 200,
                    width: double.infinity,
                  ),

                  Row(
                    children: [
                      Text('Check-in-Date'),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {
                            selectDate(context);
                          },
                          icon: Icon(Icons.date_range)),
                      Text(('${date1.year} - ${date1.month} - ${date1.day}')
                          .toString()),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Check-out-Date'),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {
                            selectDate(context);
                          },
                          icon: Icon(Icons.date_range)),
                      Text(('${date2.year} - ${date2.month} - ${date2.day}')
                          .toString()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
//Number of Adults
                  Row(
                    children: [
                      Text('Number of Adults'),
                      SizedBox(
                        width: 30,
                      ),
                      Slider(
                          value: rating_adults,
                          onChanged: (newRating) {
                            setState(() => rating_adults = newRating);
                          },
                          divisions: 10,
                          min: 0,
                          max: 10,
                          label: rating_adults.toInt().toString()),
                      Text(rating_adults.toString()),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
// Number of Children
                  Row(
                    children: [
                      Text('Number of Children'),
                      SizedBox(
                        width: 30,
                      ),
                      Slider(
                          value: rating_children,
                          onChanged: (newRating) {
                            setState(() => rating_children = newRating);
                          },
                          divisions: 10,
                          min: 0,
                          max: 10,
                          label: rating_children.toInt().toString()),
                      Text(rating_children.toString()),
                    ],
                  ),
                  //Extras
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Extras",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  CheckboxGroup(
                    labels: <String>[
                      "Breakfast(50EGP/Day)",
                      "Internet Wifi(50EGP/Day)",
                      "Parking(100EGP/Day)"
                    ],
                    onSelected: (List<String> checked_extra) =>
                       checked=checked_extra),

                  SizedBox(
                    height: 10,
                  ),
                  //View
                  Text(
                    "View",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20),
                  ),
                  RadioButtonGroup(
                      labels: <String>["Garden View", "Sea View"],
                      onSelected: (String checked) => checked_view = checked),
                  Align(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Reservation(
                                            checkin: date1,
                                            checkout: date2,
                                            num_adults: rating_adults,
                                            num_children: rating_children,
                                            Extras: checked,
                                            view: checked_view, )));
                          },
                          child: Text("Check Rooms and Rates")))
                ]),
              ),
            )));
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
