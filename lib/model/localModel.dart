// ignore_for_file: file_names

import 'package:for_u/item.dart';
import 'dart:math';

List<Item> shirt = [];
getShirt() {
  for (int i = 1; i <= 18; i++) {
    shirt.add(Item(
      name: "Shirt$i",
      imageUrl: "assets/images/shirt$i.png",
      price: 15 + Random().nextInt(50),
      category: 0,
      index: i - 1,
    ));
  }
}

List<Item> tshirt = [];
getTshirt() {
  for (int i = 1; i <= 8; i++) {
    tshirt.add(Item(
      name: "T-Shirt$i",
      imageUrl: "assets/images/tshirt${9 - i}.png",
      price: 15 + Random().nextInt(50),
      category: 1,
      index: i - 1,
    ));
  }
}

List<Item> pan = [];
getPantaloon() {
  for (int i = 1; i <= 6; i++) {
    pan.add(Item(
      name: "Jeans$i",
      imageUrl: "assets/images/pan$i.png",
      price: 15 + Random().nextInt(50),
      category: 2,
      index: i - 1,
    ));
  }
}

List<Item> jacket = [];
getJacket() {
  for (int i = 1; i <= 10; i++) {
    jacket.add(Item(
      name: "Jacket$i",
      imageUrl: "assets/images/p${11 - i}.png",
      price: 15 + Random().nextInt(60),
      category: 3,
      index: i - 1,
    ));
  }
}

List<Item> shoes = [];
getShoes() {
  for (int i = 1; i <= 8; i++) {
    shoes.add(Item(
      name: "Shoes$i",
      imageUrl: "assets/images/shoes$i.png",
      price: 15 + Random().nextInt(50),
      category: 4,
      index: i - 1,
    ));
  }
}

List<Item> short = [];
getShort() {
  for (int i = 1; i <= 6; i++) {
    short.add(Item(
      name: "Short$i",
      imageUrl: "assets/images/short$i.png",
      price: 15 + Random().nextInt(30),
      category: 5,
      index: i - 1,
    ));
  }
}

List<List> category = [
  shirt,
  tshirt,
  pan,
  jacket,
  shoes,
  short,
];
List<String> categoryName = [
  "Chemise",
  "T-Shirt",
  "Pantaloon",
  "Jacket",
  "Shoes",
  "Short",
];

List<String> allItems = [];
getAllItems() {
  for (int i = 1; i <= 18; i++) {
    allItems.add("shirt$i");
  }
  for (int i = 1; i <= 8; i++) {
    allItems.add("t-shirt$i");
  }
  for (int i = 1; i <= 6; i++) {
    allItems.add("pantaloon$i");
  }
  for (int i = 1; i <= 10; i++) {
    allItems.add("jacket$i");
  }
  for (int i = 1; i <= 8; i++) {
    allItems.add("shoes$i");
  }
  for (int i = 1; i <= 6; i++) {
    allItems.add("short$i");
  }
}
