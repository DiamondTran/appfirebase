import 'package:flutter/material.dart';

class ListDropMenuItem {
  static List<DropdownMenuItem<String>> listDrop = [];

  static void loadData() {
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text("Món văn vặt/ Đồ ăn nhanh"),
      value: "fastfodd",
    )
    );
    listDrop.add(DropdownMenuItem(
      child: Text("Chè"),
      value: "smoothie",
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("Kem/ Đồ ăn lạnh"),
      value:"cold food",
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("Đồ uống"),
      value: "drink",
    ));
    listDrop.add(DropdownMenuItem(
      child: Text("Đồ ăn no"),
      value: "foodcook",
    ));

  }

}