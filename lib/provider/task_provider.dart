import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<dynamic> tasklist = [];
  List<dynamic> completedlist = [];

  void addTask({required Map product}) {
    tasklist.add(product);
    notifyListeners();
    print(tasklist);
  }

  void removeTask({required Map product}) {
    tasklist.remove(product);
    notifyListeners();
    print(tasklist);
  }

  void editTask({required int index, required Map product}) {
    if (index >= 0 && index < tasklist.length) {
      tasklist[index] = product;
      notifyListeners();
      print(tasklist);
    } else {
      print("Index out of range");
    }
  }

   void addCompleted({required Map product}) {
    completedlist.add(product);
    notifyListeners();
    print(completedlist);
  }

  void removeCompleted({required Map product}) {
    completedlist.remove(product);
    notifyListeners();
    print(completedlist);
  }

  bool isCompleted(String id) {
    if (completedlist.isEmpty) {
      return false;
    } else {
      Map fav = completedlist.firstWhere(
        (element) => id == element['title'],
        orElse: () => {},
      );

      if (fav.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

}