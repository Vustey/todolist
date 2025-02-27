import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list/models/task.dart';

class HiveDataStore {
  static const boxName = 'taskBox';

  final Box<Task> box = Hive.box<Task>(boxName);

  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  Future<Task?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> updateTask({required Task task}) async {
    return task.save();
  }

  Future<void> deleteTask({required Task task}) async {
    return task.delete();
  }

  //Listen to Box Changes
  ValueListenable<Box<Task>> listenToTask() => box.listenable();
}
