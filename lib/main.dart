import 'package:flutter/material.dart';
import 'package:hello_world/screen/about.dart';
import 'package:hello_world/screen/basket.dart';
import 'package:hello_world/screen/history.dart';
import 'package:hello_world/screen/home.dart';
import 'package:hello_world/screen/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red),
      home: const MyHomePage(title: 'Flutters Demo Home Page'),
      routes: {
        "about": (context) => About(),
        "basket": (context) => Basket(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home(),
    Search(),
    History(),
  ];
  final List<String> _title = [
    'Home',
    'Search',
    'History',
  ];

  String emoji = "";
  Runes myEmoji = Runes('\u{1f607}');

  void tambahEmoji(int jum) {
    emoji = "";
    for (var i = 0; i < jum; i++) {
      if ((emoji.length - 1) % 5 == 0) {
        myEmoji = Runes('\u{1F621}');
      } else
        myEmoji = Runes('\u{1f607}');

      emoji += String.fromCharCodes(myEmoji);
    }
  }

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
    tambahEmoji(_counter);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_title[_currentIndex]),
      ),

      // body: myBody(context),
      body: _screens[_currentIndex], // using changing screen

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      drawer: myDrawer(),

      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.skip_previous),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.skip_next),
        ),
      ],

      bottomNavigationBar: myBottomNavBar(),
    );
  }

  Center myBody(BuildContext context) {
    return Center(
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
          Text(emoji),
        ],
      ),
    );
  }

  BottomNavigationBar myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      fixedColor: Colors.orange,
      items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "History",
          icon: Icon(Icons.history),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Drawer myDrawer() {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Depri"),
            accountEmail: Text("depriandianton22@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
            ),
          ),
          ListTile(
            title: new Text("Inbox"),
            leading: new Icon(Icons.inbox),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            title: new Text("My Cart"),
            leading: new Icon(Icons.shopping_basket),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Basket()));
            },
          ),
          ListTile(
            title: new Text("Promotions"),
            leading: new Icon(Icons.sell),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
              Navigator.pushNamed(context, "basket");
            },
          ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.help),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
              Navigator.pushNamed(
                  context, "about"); // using routing parameter in line 28
            },
          )
        ],
      ),
    );
  }
}
