import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/components/financeUpdate/financeBody.dart';
import 'package:learning_people/model/allModel.dart';

class FinanceUpdate extends StatefulWidget {
  final Finance finance;
  const FinanceUpdate({this.finance, Key key}) : super(key: key);

  @override
  _FinanceUpdateState createState() => _FinanceUpdateState();
}

class _FinanceUpdateState extends State<FinanceUpdate> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
   
    return Card(
      margin: marginCards,
      child: Container(
        padding: paddingAll10Bottom30,
        child: Column(
          children: [
            CardHeading('Finance Updated', Icons.local_atm_outlined),
            ExpandingHeader(
              'View Update',
              active: active,
              onTap: () => setState(() => active = !active),
            ),
            if (active)
              FinanceBody(finance: widget.finance)
          ],
        ),
      ),
    );
  }
}
