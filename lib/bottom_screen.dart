import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            flexibleSpace: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: 'Tab1'),
                Tab(
                  icon: Icon(Icons.directions_transit),
                  text: 'Tab2',
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: 'Tab3',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.count(
                //crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                crossAxisCount: 2,
                children: List.generate(50, (index) {
                  return Center(
                    child: Text("Item no. $index",
                        style: Theme.of(context).textTheme.headline6),
                  );
                }),
              ),
              ListView(
                children: List.generate(50, (index) {
                  return Center(
                    child: Text("Item no. $index",
                        style: Theme.of(context).textTheme.headline6),
                  );
                }),
              ),
              ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(50, (index) {
                  return Center(
                    child: Text("Item no. $index",
                        style: Theme.of(context).textTheme.headline6),
                  );
                }),
              ),
            ],
          ),
        ),
    );
  }
}

class Profile extends StatelessWidget{
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: 150,
              color: Colors.lime,


            ),
            Container(
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                              return 'Please enter name';
                          }
                          return null;
                        },

                      ),
                    ],
                  ),
              ),
          ),
        ],
      ),
    );
  }

}

class Settings extends StatelessWidget{
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child:Text(
          "SETTINGS",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}


class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Text(
          "MORE",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
