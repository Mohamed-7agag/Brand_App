// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, file_names


import 'package:flutter/material.dart';
import 'package:for_u/controller/controller.dart';
import 'package:for_u/model/localModel.dart';
import 'package:get/get.dart';

class ItemDetail extends StatefulWidget {
  final int categoryIndex;
  final int index;
  final sizeIdx;
  const ItemDetail(
      {super.key,
      required this.categoryIndex,
      required this.index,
      this.sizeIdx = -1});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  Cart controller = Get.find<Cart>();
  String conText = "";

  Widget customRadio(String txt, int index) {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.selectedIndex.value = index;
          conText = txt;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? const Color(0xff111111)
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            txt,
            style: TextStyle(
              fontFamily: 'myfont',
              fontSize: 12,
              color: controller.selectedIndex.value == index
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        body: SizedBox(
          width: mq.width,
          height: mq.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: mq.height / 2,
                  padding: const EdgeInsets.all(10),
                  width: mq.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 240, 240, 240)),
                  child: Image.asset(
                    "${category[widget.categoryIndex][widget.index].imageUrl}",
                    //fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: mq.width,
                  padding: EdgeInsets.symmetric(
                      vertical: mq.height * 0.008, horizontal: mq.width * 0.05),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mq.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${category[widget.categoryIndex][widget.index].price}\$",
                            style: const TextStyle(
                                fontFamily: 'myfont',
                                fontSize: 20,
                                color: Color(0xffffa500),
                                fontWeight: FontWeight.w600),
                          ),
                          GetBuilder<Cart>(
                            builder: (controller) => IconButton(
                              splashRadius: 5,
                              onPressed: () {
                                if (controller.cartLikedItems.contains(
                                    category[widget.categoryIndex]
                                        [widget.index])) {
                                  controller.removeLike(
                                      category[widget.categoryIndex]
                                          [widget.index]);
                                  controller.removeCategoryAndIndex(
                                      widget.categoryIndex, widget.index);
                                } else {
                                  controller.addLike(
                                      category[widget.categoryIndex]
                                          [widget.index]);
                                  controller.addCategoryAndIndex(
                                      widget.categoryIndex, widget.index);
                                }
                              },
                              icon: !controller.cartLikedItems.contains(
                                      category[widget.categoryIndex]
                                          [widget.index])
                                  ? const Icon(
                                      Icons.favorite_border_rounded,
                                      color: Color(0xffffa500),
                                      size: 35,
                                    )
                                  : const Icon(
                                      Icons.favorite_rounded,
                                      color: Color(0xffffa500),
                                      size: 35,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${category[widget.categoryIndex][widget.index].name}",
                        style: const TextStyle(
                            fontFamily: 'myfont',
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: mq.height * 0.025,
                      ),
                      GetBuilder<Cart>(
                        builder: (controller) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customRadio("XS", 1),
                            customRadio("S", 2),
                            customRadio("M", 3),
                            customRadio("L", 4),
                            customRadio("XL", 5),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mq.height * 0.03,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          
                          if (controller.selectedIndex.value != 0) {
                            
                            if (controller.cartitems.contains(
                                category[widget.categoryIndex][widget.index])) {
                              Get.defaultDialog(actions: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Text("OK")),
                              ], middleText: "Item Already Exist In cart");
                            } else {
                              controller.addSize(conText);
                              Get.snackbar(
                                "",
                                "",
                                duration: const Duration(milliseconds: 1100),
                                titleText: const Text(
                                  "Done",
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'myfont'),
                                ),
                                messageText: const Text(
                                  "Item Added To Cart",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: 'myfont'),
                                ),
                              );
                              
                              controller.add(
                                  category[widget.categoryIndex][widget.index]);
                            }
                          } else {
                            Get.defaultDialog(actions: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Text("OK")),
                            ], middleText: "Must Choose Size");
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size.fromWidth(mq.width)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff111111)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 7)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add To Cart  ",
                              style: TextStyle(
                                fontFamily: 'myfont',
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
