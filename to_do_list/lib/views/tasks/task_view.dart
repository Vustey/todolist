import 'package:flutter/material.dart';
import 'package:to_do_list/extensions/space_exs.dart';
import 'package:to_do_list/utils/app_colors.dart';
import 'package:to_do_list/utils/app_str.dart';
import 'package:to_do_list/views/tasks/components/date_time_selection.dart';
import 'package:to_do_list/views/tasks/components/rep_textfield.dart';
import 'package:to_do_list/views/tasks/widget/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        //AppBar
        appBar: TaskViewAppBar(),

        //Body
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Top side texts
                _buildTopSideTexts(textTheme),

                _buildMainTaskView(textTheme, context),

                ///Bottom Side Buttons
                _buildBottomSideButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSideButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: () {
              print("Delete task");
            },
            minWidth: 150,
            height: 55,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(Icons.close, color: AppColors.primaryColor),
                5.w,
                Text(
                  AppStr.deleteTask,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),

          MaterialButton(
            onPressed: () {
              print("Add new task");
            },
            minWidth: 150,
            height: 55,
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                5.w,
                Text(AppStr.addNewTask, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainTaskView(TextTheme textTheme, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 530,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              AppStr.titleOfTitleTextField,
              style: textTheme.titleMedium,
            ),
          ),

          //Title text field
          RepTextTitle(controller: titleController),
          10.h,
          RepTextTitle(
            controller: descriptionController,
            isForDescription: true,
          ),

          DateTimeSelectWidget(
            onTap: () async {
              // ignore: unused_local_variable
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
            },
            title: AppStr.timeString,
          ),

          DateTimeSelectWidget(
            onTap: () async {
              // ignore: unused_local_variable
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now().add(Duration(days: 1)),
                firstDate: DateTime.now().add(Duration(days: 1)),
                lastDate: DateTime(9999, 12, 31),
              );
            },
            title: AppStr.dateString,
          ),
        ],
      ),
    );
  }

  Widget _buildTopSideTexts(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 70, child: Divider(thickness: 2)),
          RichText(
            text: TextSpan(
              text: AppStr.addNewTask,
              style: textTheme.titleLarge,
              children: [
                TextSpan(
                  text: AppStr.taskString,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(width: 70, child: Divider(thickness: 2)),
        ],
      ),
    );
  }
}
