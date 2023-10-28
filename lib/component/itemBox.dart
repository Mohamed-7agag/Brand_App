// ignore_for_file: unnecessary_string_interpolations,, file_names

import 'package:flutter/material.dart';
import 'package:for_u/controller/controller.dart';
import 'package:for_u/model/localModel.dart';
import 'package:for_u/view/itemDetail.dart';
import 'package:get/get.dart';

class ItemBox extends StatefulWidget {
  final int index;
  final int categoryIndex;
  const ItemBox({
    super.key,
    required this.index,
    required this.categoryIndex,
  });

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  Cart controller = Get.put(Cart());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        controller.selectedIndex.value = 0;
        Get.to(() => ItemDetail(
            categoryIndex: widget.categoryIndex, index: widget.index));
      },
      child: Container(
        padding: EdgeInsets.only(
            top: mq.height * 0.009,
            right: mq.width * 0.02,
            left: mq.width * 0.02,
            bottom: mq.height * 0.002),
        width: mq.width / 2.3,
        height: mq.height / 3.5,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Color.fromARGB(13, 0, 0, 0), blurRadius: 2.0)
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 165,
              padding: const EdgeInsets.all(7),
              width: mq.width / 2.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 240, 240, 240)),
              child: Image.asset(
                "${category[widget.categoryIndex][widget.index].imageUrl}",
              ),
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " ${category[widget.categoryIndex][widget.index].name}",
                      style:
                          const TextStyle(fontFamily: 'myfont', fontSize: 13),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      " ${category[widget.categoryIndex][widget.index].price}\$",
                      style: const TextStyle(
                          fontFamily: 'myfont',
                          fontSize: 14,
                          color: Color(0xffffa500),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                GetBuilder<Cart>(
                  builder: (controller) => IconButton(
                    splashRadius: 5,
                    onPressed: () {
                      if (controller.cartLikedItems.contains(
                          category[widget.categoryIndex][widget.index])) {
                        controller.removeLike(
                            category[widget.categoryIndex][widget.index]);
                        
                      } else {
                        controller.addLike(
                            category[widget.categoryIndex][widget.index]);
                        
                      }
                    },
                    icon: !controller.cartLikedItems.contains(
                            category[widget.categoryIndex][widget.index])
                        ? const Icon(
                            Icons.favorite_border_rounded,
                            color: Color(0xffffa500),
                          )
                        : const Icon(
                            Icons.favorite_rounded,
                            color: Color(0xffffa500),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
