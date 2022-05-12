import 'package:flutter_application/provider/mainstate.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'package:flutter/material.dart';

class BuyListView extends StatefulWidget {
  @override
  State<BuyListView> createState() => _BuyListViewState();
}

class _BuyListViewState extends State<BuyListView> {
  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text('SIM JAEYUN STORE'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    createTile(Baju baju) => Hero(
      tag: baju.jenis,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.purple.shade900,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'detail/${baju.jenis}');
          },
          child: Image(
            image: AssetImage(baju.gambar),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    ///create baju grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: context.watch<MainState>().bajus.map((baju) => createTile(baju)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Buy List'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: grid,
    );
  }
}