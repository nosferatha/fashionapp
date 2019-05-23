import 'package:flutter/material.dart';

void main() => runApp(FashionApp());

class FashionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomeFashionApp(),
    );
  }
}

final stories = Expanded(
  child: new Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: new ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              new Container(
                width: 60.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              index == 0
                  ? Positioned(
                      right: 10.0,
                      child: new CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 10.0,
                        child: new Icon(
                          Icons.add,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ))
                  : new Container()
            ],
          ),
    ),
  ),
);

class MyHomeFashionApp extends StatefulWidget {
  MyHomeFashionApp() : super();

  @override
  _MyHomeFashionAppState createState() => _MyHomeFashionAppState();
}

class _MyHomeFashionAppState extends State<MyHomeFashionApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          tooltip: "Buscar",
          onPressed: onSearchButtonPressed,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark),
            tooltip: 'Favoritos',
            onPressed: onFavoriteButtonPressed,
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.accessibility),
              text: "DRESS TIME",
            ),
            new Tab(
              icon: new Icon(Icons.work),
              text: "TIMELESS",
            ),
            new Tab(
              icon: new Icon(Icons.alarm),
              text: "MOM",
            ),
          ],
        ),
      ),
      body: new Container(
        margin: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            stories,
          ],
        ),
      ),
    );
  }

  void onFavoriteButtonPressed() {}

  void onSearchButtonPressed() {}
}
