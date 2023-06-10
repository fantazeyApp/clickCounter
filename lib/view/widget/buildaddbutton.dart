import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import '../counter_dialog.dart';
import '../../model/counter_hive_model.dart';

class BuildAddButton extends StatelessWidget {
  const BuildAddButton({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
    required this.func,
    required this.counterModel,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  final Function(String, int, int, String, String) func;
  final CounterHiveModel? counterModel;

  String dateCreation() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = counterModel != null;
    final text = isEdit ? S.of(context).isedit_save : S.of(context).isedit_add;
    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          final name = controller1.text;
          final count = int.tryParse(controller2.text) ?? 0;
          final total = int.tryParse(controller3.text) ?? 0;
          final comment = controller4.text;
          final date = dateCreation();
          func(name, count, total, comment, date);
          Navigator.of(context).pop();
        }
      },
    );
  }
}
