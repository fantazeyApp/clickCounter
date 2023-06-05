import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/counter_hive_model.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  CounterHiveModel model = CounterHiveModel();

  /// List of Tab Bar Item
  List<String> items = [
    "Total",
    "Comment",
    "Date",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.comment,
    Icons.date_range,
  ];

  
  int current = 0;

  @override
  Widget build(BuildContext context) {

    /* List<dynamic> status = [
    model.totalCount,
    model.comment,
    model.dateCreation
  ]; */

    return Column(
      children: [
        /// CUSTOM TABBAR
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                          color: current == index
                              ? Colors.white70
                              : Colors.white54,
                          borderRadius: current == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                          border: current == index
                              ? Border.all(
                                  color: Colors.deepPurpleAccent, width: 2)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: GoogleFonts.laila(
                                fontWeight: FontWeight.w500,
                                color: current == index
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: current == index,
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              shape: BoxShape.circle),
                        ))
                  ],
                );
              }),
        ),

        /// MAIN BODY
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             // Text(status[current]),
                  const SizedBox(
                    height: 10,
                  ),
              Text(
                items[current],
                style: GoogleFonts.laila(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
