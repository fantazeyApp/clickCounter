import 'package:click_counter/core/sizedbox.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../counter_dialog.dart';
import '../counter_view.dart';
import '../../model/counter_hive_model.dart';

class BuildButtons extends StatelessWidget {
  const BuildButtons({super.key, required this.model});

  final CounterHiveModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: TextButton.icon(
            icon: const Icon(Icons.open_in_new),
            label: Text(S.of(context).btn_open_title),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CounterView(
                    counterModel: model,
                    onClickedDone: (name, number, total, comment) =>
                        openCounter(model, name, number, total, comment)))),
          )),
          10.pw,
          Expanded(
              child: TextButton.icon(
            icon: const Icon(Icons.edit),
            label: Text(S.of(context).btn_edit_title),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SingleChildScrollView(
                      child: CounterDialog(
                          counterModel: model,
                          onClickedDone: (name, number, total, comment, date) =>
                              editCounter(model, name, number, total, comment)),
                    ))),
          )),
          10.pw,
          Expanded(
              child: TextButton.icon(
                  icon: const Icon(Icons.delete),
                  label: Text(S.of(context).btn_delete_title),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xFFCDF0FC),
                            title: Text(S.of(context).alert_dialog_title),
                            content: Text(S.of(context).alert_dialog_content),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child:  Text(S.of(context).cansel_navigator)),
                              TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    deleteCounter(model);
                                  },
                                  child:  Text(S.of(context).ok_navigator)),
                            ],
                          );
                        });
                  }))
        ],
      ),
    );
  }

  void editCounter(CounterHiveModel model, String name, int number, int total,
      String comment) async {
    model.title = name;
    model.count = number;
    model.totalCount = total;
    model.comment = comment;
    await model.save();
  }

  void openCounter(CounterHiveModel model, String name, int number, int total,
      String comment) {
    model.title = name;
    model.count = number;
    model.totalCount = total;
    model.comment = comment;
  }

  void deleteCounter(CounterHiveModel model) async {
    await model.delete();
  }
}
