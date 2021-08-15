import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/model/allModel.dart';

class FinanceBody extends StatelessWidget {
  final Finance finance;
  const FinanceBody({this.finance,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
      ListTile(
        title: Text('Finance Through'),
        subtitle: Text(finance.financerName ?? ''),
        trailing: CircularIcon(
          Icons.local_atm_outlined,
          imageUrl: finance.financerUrl,
          radius: 30,
        ),
      ),
      ProgressBar(finance.paidCycle / finance.totalPaymentCycle),
      TabularData('Payments made:',
          '${finance.paidCycle} of ${finance.totalPaymentCycle} payments'),
      TabularData(
        'Next payment due:',
        DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(
            finance.nextPaymentDateEpoch)),
        isYellow: true,
      ),
    ]
,
    );
  }
}