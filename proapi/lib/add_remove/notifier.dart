import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  List fav_List = [];

  addTolist(index) {
    fav_List.add(index);
    notifyListeners();
  }

  removeTolist(index) {
    fav_List.remove(index);
    notifyListeners();
  }
}
