
import 'package:flutter/material.dart';
import 'package:for_u/controller/controller.dart';
import 'package:for_u/view/itemDetail.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                flex: 0,
                child: GetBuilder<Cart>(
                  builder: (controller) => Text(
                    "${controller.cartItemsLength} Cart Item",
                    style: const TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffa500)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 239, 239, 239)),
                      borderRadius: BorderRadius.circular(18)),
                  width: mq.width,
                  child: GetBuilder<Cart>(
                    builder: (controller) => ListView.builder(
                      itemCount: controller.cartItemsLength,
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          padding: EdgeInsets.only(right: mq.width * 0.01),
                          margin: const EdgeInsets.only(bottom: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: mq.width * 0.25,
                                    height: mq.height * 0.12,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                          255, 240, 240, 240),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => ItemDetail(
                                            categoryIndex: controller
                                                .cartitems[i].category,
                                            index:
                                                controller.cartitems[i].index,
                                            sizeIdx: controller.size[i],
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        "${controller.cartitems[i].imageUrl}",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.02,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.cartitems[i].name}",
                                          style: const TextStyle(
                                              fontFamily: 'myfont',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${controller.cartitems[i].price}\$",
                                          style: const TextStyle(
                                              fontFamily: 'myfont',
                                              fontSize: 15,
                                              color: Color(0xffffa500),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Size : ${controller.size[i]}",
                                          style: const TextStyle(
                                              fontFamily: 'myfont',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.remove(controller.cartitems[i]);
                                  },
                                  icon: Icon(
                                    Icons.cancel_rounded,
                                    color: Colors.red[600],
                                    size: 27,
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total : ",
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        GetBuilder<Cart>(
                          builder: (controller) => Text(
                            "${controller.totalprice}\$",
                            style: const TextStyle(
                                fontFamily: 'myfont',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffa500)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.025,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.totalprice != 0) {
                          Get.defaultDialog(actions: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Text("OK")),
                          ], title: "Done", middleText: "Successful Order");
                        } else {
                          Get.defaultDialog(actions: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Text("OK")),
                          ], title: "Sorry", middleText: "No Item In Cart");
                        }
                      },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size.fromWidth(mq.width)),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff111111)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: mq.height * 0.015)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      child: const Text(
                        "CheckOut",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
