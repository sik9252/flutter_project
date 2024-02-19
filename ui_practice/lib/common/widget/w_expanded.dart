import 'package:flutter/material.dart';

const expandedWidget = ExpandedWidget();

class ExpandedWidget extends StatelessWidget {
  final int flex;

  const ExpandedWidget({Key? key, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }
}
