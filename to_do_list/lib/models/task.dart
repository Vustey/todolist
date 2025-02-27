import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';


@HiveType(typeId: 0)
class Task extends HiveObject {
  Task({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.isCompleted,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subTitle;
  @HiveField(3)
  DateTime createdAtTime;
  @HiveField(4)
  DateTime createdAtDate;
  @HiveField(5)
  final bool isCompleted;

  factory Task.create({
    required String? id,
    required String? title,
    required String? subTitle,
    DateTime? createdAtTime,
    DateTime? createdAtDate,
    bool? isCompleted,
  }) => Task(
    id: const Uuid().v1(),
    title: title ?? "",
    subTitle: subTitle ?? "",
    createdAtTime: createdAtTime ?? DateTime.now(),
    createdAtDate: createdAtDate ?? DateTime.now(),
    isCompleted: false,
  );
}
