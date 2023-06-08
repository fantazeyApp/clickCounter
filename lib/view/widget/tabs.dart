import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/counter_hive_model.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key, required this.modelValue}) : super(key: key);
  final CounterHiveModel modelValue;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<String> items = [
    "Total",
    "Comment",
    "Date",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> itemBody = [
      TotalScore(model: widget.modelValue),
      Comment(model: widget.modelValue),
      CreationDate(model: widget.modelValue),
    ];

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 65,
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
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.white70
                              : Colors.white54,
                          borderRadius: currentIndex == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                          border: currentIndex == index
                              ? Border.all(
                                  color: const Color(0xFF00B0F0), width: 2)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: GoogleFonts.laila(
                                fontWeight: FontWeight.w500,
                                color: currentIndex == index
                                    ? Colors.black
                                    : Colors.black45),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2), //top padding 5
                      height: 2,
                      width: 30,
                      color: currentIndex == index
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ],
                );
              }),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              itemBody[currentIndex],
            ],
          ),
        ),
      ],
    );
  }
}

class TotalScore extends StatelessWidget {
  const TotalScore({super.key, required this.model});
  final CounterHiveModel model;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: 'Total score: ',
        style: GoogleFonts.laila(fontSize: 18),
        children: <TextSpan>[
          TextSpan(
              text: model.totalCount.toString(),
              style: GoogleFonts.laila(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue))
        ]));
  }
}

class Comment extends StatelessWidget {
  const Comment({super.key, required this.model});
  final CounterHiveModel model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(model.comment, style: GoogleFonts.laila(fontSize: 18)),
                  ))),
    );
  }
}

class CreationDate extends StatelessWidget {
  const CreationDate({super.key, required this.model});
  final CounterHiveModel model;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: 'Creation date:\n',
          style: GoogleFonts.laila(fontSize: 18),
          children: <TextSpan>[
            TextSpan(
                text: model.dateCreation,
                style: GoogleFonts.laila(
                    fontSize: 18, fontWeight: FontWeight.w500))
          ]),
    );
  }
}
