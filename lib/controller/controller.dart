// ignore_for_file: prefer_final_fields,, non_constant_identifier_names

import 'package:for_u/item.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class Cart extends GetxController {
  List<Item> _items = [];
  List<Item> _likedItems = [];
  List<List> _categortAndIndex = [];
  List<String> _size = [];
  int _price = 0;

  void add(Item item) {
    _price += item.price;
    _items.add(item);
    update();
  }

  void remove(Item item) {
    _price -= (item.price);
    _items.remove(item);
    update();
  }

  void addLike(Item item) {
    _likedItems.add(item);
    update();
  }

  void removeLike(Item item) {
    _likedItems.remove(item);
    update();
  }

  void addCategoryAndIndex(int categoryIndex, int index) {
    _categortAndIndex.add([categoryIndex, index]);
    update();
  }

  void removeCategoryAndIndex(int categoryIndex, int index) {
    _categortAndIndex.removeWhere((element) =>
        const ListEquality().equals(element, [categoryIndex, index]));
    update();
  }

  void addSize(String s) {
    _size.add(s);
    update();
  }

  get CategoryAndIndex {
    return _categortAndIndex;
  }

  get size {
    return _size;
  }

  get CategoryAndIndexLength {
    return _categortAndIndex.length;
  }

  get cartItemsLength {
    return _items.length;
  }

  get totalprice {
    return _price;
  }

  get cartitems {
    return _items;
  }

  get cartLikedItems {
    return _likedItems;
  }

  get cartLikedItemsLength {
    return _likedItems.length;
  }

  RxInt curIndex = 0.obs;
  RxInt selectedIndex = 0.obs;

  
}
