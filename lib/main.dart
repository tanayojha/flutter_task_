import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(),
      //home: CheckApp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> list = ['Title 1', 'Title 2', 'Title 3', 'Title 4', 'Title 5', 'Title 6', 'Title 7', 'Title 8', 'Title 9', 'Title 10'];

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 200.0,
            actions: const [
              Padding(
                  padding:
                  EdgeInsets.only(top: 0, left: 0, right: 15.0, bottom: 0),
                  child: Icon(Icons.my_location))
            ],
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "Serv",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              centerTitle: true,
            ),
          ),
          const SliverToBoxAdapter(),
        _getSlivers(list, context),//SliverList
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lime,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                    content: const Text("Item 1 clicked"),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          //do code
                        }));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
              backgroundColor: Colors.lime),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "More",
              backgroundColor: Colors.redAccent),
        ],
        currentIndex: _selectedIndex,
        onTap: (setValue) {
          setState(() {
            _selectedIndex = setValue;
          });
        },
      ),
      /*bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}

SliverList _getSlivers(List myList, BuildContext context) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
          //return buildRow(myList[index]);
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                        leading: const Icon(Icons.search),
                        title: const Text("Search for a service"),
                        onTap: () {}),
                  ),
                ),
              );
            }
            else if (index == 1) {
              return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, position) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: [
                              //All ITEMS here
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 18,
                                      right: 8,
                                      bottom: 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 85,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          child: const Image(
                                            image: NetworkImage(
                                                'https://www.tutorialkart.com/img/hummingbird.png'),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                        EdgeInsets.all(5),
                                        child: Text(
                                          "Hardly Man",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign:
                                          TextAlign.left,
                                          textDirection:
                                          TextDirection.rtl,
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 18,
                                      right: 8,
                                      bottom: 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 85,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          child: const Image(
                                            image: NetworkImage(
                                                'https://www.tutorialkart.com/img/hummingbird.png'),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                        EdgeInsets.all(5),
                                        child: Text(
                                          "Hardly Man",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign:
                                          TextAlign.left,
                                          textDirection:
                                          TextDirection.rtl,
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 18,
                                      right: 8,
                                      bottom: 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 85,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          child: const Image(
                                            image: NetworkImage(
                                                'https://www.tutorialkart.com/img/hummingbird.png'),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                        EdgeInsets.all(5),
                                        child: Text(
                                          "Hardly Man",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign:
                                          TextAlign.left,
                                          textDirection:
                                          TextDirection.rtl,
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 18,
                                      right: 8,
                                      bottom: 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 85,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(5),
                                          child: const Image(
                                            image: NetworkImage(
                                                'https://www.tutorialkart.com/img/hummingbird.png'),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                        EdgeInsets.all(5),
                                        child: Text(
                                          "Hardly Man",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign:
                                          TextAlign.left,
                                          textDirection:
                                          TextDirection.rtl,
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),
                      );
                  }
              );
            }
      },
      childCount: myList.length,
    ),
  );
}

buildRow(String title) {
  return Padding(padding: const EdgeInsets.all(15.0),child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)));
}

class CheckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 0, top: 60.0, right: 0, bottom: 10.0),
              child: Center(
                  child: Text(
                "Serv",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                    leading: const Icon(Icons.search),
                    title: const Text("Search for a service"),
                    onTap: () {}),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
            ],
          ),
          Column(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lime,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                    content: const Text("Item 1 clicked"),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          //do code
                        }));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              title: const Text("Item 2"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
              backgroundColor: Colors.lime),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "More",
              backgroundColor: Colors.redAccent),
        ],
        currentIndex: 0,
        onTap: (setValue) {
          /*setState(() {
            _selectedIndex = setValue;
          });*/
        },
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {required this.child,
      required this.height,
      required this.width,
      required this.color});
  final Widget child;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: child,
      ),
    );
  }
}
