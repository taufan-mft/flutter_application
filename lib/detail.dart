import 'package:flutter_application/provider/mainstate.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'ratingbar.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Baju baju;

  Detail(this.baju);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      title: Text('SIM JAEYUN'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: widget.baju.jenis,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.purple.shade900,
              child: Image(
                image: AssetImage(widget.baju.gambar),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text('${widget.baju.stok} stok', color: Colors.white30, size: 12)
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(widget.baju.jenis,
            size: 16,
            isBold: true,
            color: Colors.black,
            padding: EdgeInsets.only(top: 16.0)),
        text(
          'merk ${widget.baju.merk}',
          color: Colors.black,
          size: 12,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: <Widget>[
            text(
              widget.baju.harga,
              isBold: true,
              color: Colors.black,
              padding: EdgeInsets.only(right: 8.0),
            ),
            RatingBar(rating: widget.baju.rating, color: Colors.white70)
          ],
        ),
        SizedBox(height: 32.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: () {
              if (!context.read<MainState>().bajus.contains(widget.baju)) {
                context.read<MainState>().updateList(widget.baju);
              }
            },
            minWidth: 160.0,
            color: Colors.blue,
            child: text(!context.watch<MainState>().bajus.contains(widget.baju) ?'BELI' : 'TERBELI', color: Colors.white, size: 13),
          ),
        )
      ],
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description
    final bottomContent = Container(
      height: 220.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          widget.baju.deskripsi,
          style: TextStyle(fontSize: 13.0, height: 1.5),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  ///create text widget
  text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}
