// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:for_u/component/itemBox.dart';
import 'package:for_u/controller/controller.dart';
import 'package:for_u/model/localModel.dart';
import 'package:for_u/view/all_category_items.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
            vertical: mq.height * 0.01, horizontal: mq.width * 0.045),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome,",
                style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 30,
                    color: Color(0xffffa500),
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                "Our fashion World",
                style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 11,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == "") {
                    return const Iterable.empty();
                  }
                  return allItems.where((String element) =>
                      element.contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (option) {
                  print(option);
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  return TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintText: "Search clothes..",
                      hintStyle:
                          const TextStyle(fontFamily: "myfont", fontSize: 12),
                      filled: true,
                      fillColor: const Color.fromARGB(137, 224, 224, 224),
                    ),
                  );
                },
              ),
              SizedBox(
                height: mq.height * 0.025,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const AllCategoryItems(categoryIndex: 0));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Chemise",
                          style: TextStyle(fontFamily: 'myfont', fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AllCategoryItems(categoryIndex: 1));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "T-Shirt",
                          style: TextStyle(fontFamily: 'myfont', fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AllCategoryItems(categoryIndex: 2));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Pantaloon",
                          style: TextStyle(fontFamily: 'myfont', fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AllCategoryItems(categoryIndex: 3));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Jacket",
                          style: TextStyle(fontFamily: 'myfont', fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AllCategoryItems(categoryIndex: 4));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Shoes",
                          style: TextStyle(fontFamily: 'myfont', fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AllCategoryItems(categoryIndex: 5));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Short",
                          style: TextStyle(fontFamily: 'myfont', fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Container(
                width: mq.width,
                height: mq.height / 6,
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.07),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff111111)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "Get ",
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: "30% ",
                                style: TextStyle(
                                    color: Color(0xffffa500), fontSize: 34)),
                            TextSpan(text: "Off"),
                            TextSpan(text: "\nFor All Items")
                          ]),
                    ),
                    Image.asset("assets/images/banner3.png")
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              const Text(
                "Best Collection",
                style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemBox(index: 5, categoryIndex: 0),
                  ItemBox(index: 2, categoryIndex: 3),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemBox(index: 5, categoryIndex: 4),
                  ItemBox(index: 0, categoryIndex: 1),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
