import 'package:flutter/material.dart';
import 'budgetList.dart';
import 'budgetDisp.dart';

class BList extends StatelessWidget {
  final List<budList> newBuds;
  BList(this.newBuds);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }


  ListView _buildList(context) {
    return ListView.builder(
      itemCount: newBuds.length,
      itemBuilder: (context, int) {
        return budDisp(newBuds[int]);
      },
    );
  }


}