import 'package:fast_app_base/common/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class TodoDataHolder extends GetxController {
  // final TodoDataNotifier notifier;
  final RxList<Todo> todoList = <Todo>[].obs;

  // const TodoDataHolder({super.key, required super.child, required this.notifier});
  //
  // @override
  // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  //   return true;
  // }
  //
  // static TodoDataHolder _of(BuildContext context) {
  //   TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
  //   return inherited;
  // }

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

    todoList.refresh();
    //notifier.notify();
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch, title: result.text, dueDate: result.dateTime));
      // notifier.addTodo(Todo(
      //     id: DateTime.now().millisecondsSinceEpoch, title: result.text, dueDate: result.dateTime));
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      todoList.refresh();
      //notifier.notify();
    }
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
    // notifier.value.remove(todo);
    // notifier.notify();
  }
}

// extension TodoDataHolderContextExtennsion on BuildContext {
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}