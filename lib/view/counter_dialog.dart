// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:click_counter/view/widget/buildaddbutton.dart';
import 'package:click_counter/view/widget/buildcancelbutton.dart';
import 'package:click_counter/view/widget/buildcomment.dart';
import 'package:click_counter/view/widget/buildcount.dart';
import 'package:click_counter/view/widget/buildname.dart';
import 'package:click_counter/view/widget/buildtotalcount.dart';
import 'package:flutter/material.dart';

import 'package:click_counter/core/sizedbox.dart';

import '../model/counter_hive_model.dart';

final formKey = GlobalKey<FormState>();

class CounterDialog extends StatefulWidget {
  const CounterDialog({
    Key? key,
    this.counterModel,
    required this.onClickedDone,
  }) : super(key: key);

  final CounterHiveModel? counterModel;
  final Function(
          String name, int number, int total, String comment, String date)
      onClickedDone;

  @override
  State<CounterDialog> createState() => _CounterDialogState();
}

class _CounterDialogState extends State<CounterDialog> {
  final nameController = TextEditingController();
  final countController = TextEditingController(text: '0');
  final totalController = TextEditingController(text: '0');
  final commentController = TextEditingController(text: 'Counter comment');
  late String formatted;

  @override
  void initState() {
    if (widget.counterModel != null) {
      final counterModel = widget.counterModel;
      nameController.text = counterModel!.title;
      countController.text = counterModel.count.toString();
      totalController.text = counterModel.totalCount.toString();
      commentController.text = counterModel.comment;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    countController.dispose();
    totalController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.counterModel != null;
    final title = isEditing ? 'Edit counter' : 'Add counter';

    return SafeArea(
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: const Color(0xFFCDF0FC),
        title: Text(title),
        titleTextStyle: const TextStyle(fontSize: 24, color: Colors.black),
        content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  10.ph,
                  BuildName(controller: nameController),
                  10.ph,
                  BuildCount(
                    controller: countController,
                  ),
                  10.ph,
                  BuildTotalCount(
                    controller: totalController,
                  ),
                  10.ph,
                  BuildComment(
                    controller: commentController,
                  ),
                ],
              ),
            )),
        actions: <Widget>[
          const BuildCancelButton(),
          BuildAddButton(
              controller1: nameController,
              controller2: countController,
              controller3: totalController,
              controller4: commentController,
              func: widget.onClickedDone,
              counterModel: widget.counterModel),
        ],
      ),
    );
  }
}
