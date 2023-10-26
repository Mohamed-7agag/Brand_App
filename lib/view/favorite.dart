import 'package:flutter/material.dart';
import 'package:for_u/component/itemfavoriteBox.dart';
import 'package:for_u/controller/controller.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Cart controller = Get.put(Cart());
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mq.width,
          height: mq.height,
          padding: EdgeInsets.symmetric(
              vertical: mq.height * 0.01, horizontal: mq.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: GetBuilder<Cart>(
                  builder: (controller) => Text(
                    "${controller.cartLikedItemsLength} Favorite Products",
                    style: const TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffa500)),
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: SizedBox(
                  width: mq.width,
                  child: GetBuilder<Cart>(
                    builder: (controller) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisExtent: mq.height / 3.5,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.CategoryAndIndexLength,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemFavoriteBox(
                          index: controller.CategoryAndIndex[index][1],
                          categoryIndex: controller.CategoryAndIndex[index][0],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
