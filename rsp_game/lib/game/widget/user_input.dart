import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';

import 'input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final Function(InputType) callback;
  final InputType? userInput;

  const UserInput(
      {required this.isDone,
      required this.callback,
      this.userInput,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(children: [
        const Expanded(child: SizedBox.shrink()),
        Expanded(child: InputCard(child: Image.asset(userInput!.path))),
        const Expanded(child: SizedBox.shrink()),
      ]);
    }

    return Row(
      children: _getInputs(callback),
    );
  }

  List<Widget> _getInputs(Function(InputType) callback) {
    return InputType.values
        .map(
          (type) => Expanded(
            child: InkWell(
              onTap: () => callback.call(type),
              child: InputCard(
                child: Image.asset(type.path),
              ),
            ),
          ),
        )
        .toList();
  }
}
