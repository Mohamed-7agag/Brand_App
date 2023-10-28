// ignore_for_file: prefer_final_fields,, non_constant_identifier_names

import 'package:for_u/item.dart';
import 'package:get/get.dart';
class Cart extends GetxController {
  List<Item> _items = [];
  List<Item> _likedItems = [];
  List<String> _size = [];
  int _price = 0;

  void add(Item item, String choosedSize) {
    _price += item.price;
    item.size = choosedSize;
    _items.add(item);
    update();
  }

  void remove(int i) {
    _price -= (_items[i].price);
    _size.removeAt(i);
    _items.removeAt(i);
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

  void addSize(String s) {
    _size.add(s);
    update();
  }

  get size {
    return _size;
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
