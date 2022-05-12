

import 'package:flutter/material.dart';
import 'package:flutter_application/data.dart';

class MainState extends ChangeNotifier {
  List<Baju> bajus = [];

  void updateList(Baju baju) {
    bajus.add(baju);
    notifyListeners();
  }
}