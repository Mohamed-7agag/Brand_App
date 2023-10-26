import 'package:flutter/material.dart';
import 'package:for_u/component/itemBox.dart';
import 'package:for_u/model/localModel.dart';

class AllCategoryItems extends StatefulWidget {
  final int categoryIndex;
  const AllCategoryItems({super.key, required this.categoryIndex});

  @override
  State<AllCategoryItems> createState() => _AllCategoryItemsState();
}

class _AllCategoryItemsState extends State<AllCategoryItems> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mq.width,
          height: mq.height,
          padding: EdgeInsets.symmetric(
              vertical: mq.height * 0.01, horizontal: mq.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Expanded(
                flex: 1,
                child: Text(
                  "${categoryName[widget.categoryIndex]} Products",
                  style: const TextStyle(
                      fontFamily: 'myfont',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffa500)),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                flex: 17,
                child: SizedBox(
                  width: mq.width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisExtent: mq.height / 3.5,
                      mainAxisSpacing: 12,
                      crossAxisCount: 2,
                    ),
                    itemCount: category[widget.categoryIndex].length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemBox(
                        index: index,
                        categoryIndex: widget.categoryIndex,
                      );
                    },
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
