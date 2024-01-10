import 'package:fast_app_base/common/data/memory/vo/todo_data_notifier.dart';
import 'package:fast_app_base/common/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/cupertino.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({super.key, required super.child, required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) => todo.status = TodoStatus.incomplete);
    }
    notifier.notify();
  }

  void addTodo(Todo todo) async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      // mounted를 이용해서 현재 스크린이 살아있는지 체크
      notifier.addTodo(Todo(
          id: DateTime.now().millisecondsSinceEpoch, title: result.text, dueDate: result.dateTime));
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      notifier.notify();
    }
  }

  void removeTodo(Todo todo) {
    notifier.value.remove(todo);
    notifier.notify();
  }
}

extension TodoDataHolderContextExtennsion on BuildContext {
  TodoDataHolder get holder => TodoDataHolder._of(this);
}
