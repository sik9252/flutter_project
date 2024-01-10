import 'package:fast_app_base/common/data/memory/vo/todo_status.dart';

class Todo {
  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;

  // createTime은 todo가 생성될때 만들어지면 되기 때문에 :를 통해 변수에 따로 gkfekd
  Todo({required this.id, required this.title, required this.dueDate, this.status = TodoStatus
      .incomplete}) : createdTime = DateTime.now();
}