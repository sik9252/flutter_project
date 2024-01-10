import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => todoData.todoList.isEmpty
          ? '할 일을 작성해보세요'.text.size(30).makeCentered()
          : Column(
              children: todoData.todoList.map((todo) => TodoItem(todo)).toList(),
            ),
    );
    // return ValueListenableBuilder(
    //     valueListenable: context.holder.notifier,
    //     builder: (context, todoList, child) {
    //       return todoList.isEmpty
    //           ? '할 일을 작성해보세요'.text.size(30).makeCentered()
    //           : Column(
    //               children: todoList.map((todo) => TodoItem(todo)).toList(),
    //             );
    //     });
  }
}
