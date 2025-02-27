import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/extensions/space_exs.dart';
import 'package:to_do_list/utils/app_colors.dart';
import 'package:to_do_list/utils/app_str.dart';
import 'package:to_do_list/utils/constraints.dart';
import 'package:to_do_list/views/home/components/home_app_bar.dart';
import 'package:to_do_list/views/home/widget/slider_drawer.dart';
import 'package:to_do_list/views/home/components/task_widget.dart';
import 'package:to_do_list/views/home/components/fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> sliderKey = GlobalKey<SliderDrawerState>();
  final List<int> testList = [1, 2];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      //Fab button
      floatingActionButton: Fab(),

      //Body
      body: SliderDrawer(
        key: sliderKey,
        isDraggable: false,
        animationDuration: 1000,

        slider: CustomDrawer(),
        appBar: HomeAppBar(sliderKey: sliderKey),
        child: _buildHomeBody(textTheme),
      ),
    );
  }

  Widget _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          // Tiêu đề và Progress Indicator
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircularProgressIndicator
                SizedBox(
                  width: 30,
                  height: 30,
                  child: const CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                25.w,
                // Thông tin Task
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStr.mainTitle, style: textTheme.displayLarge),
                    3.h,
                    Text("1 of 3 Tasks", style: textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ),

          // Divider
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(thickness: 2, indent: 100),
          ),

          // Bọc danh sách task trong Expanded để tránh lỗi overflow
          Expanded(
            child:
                testList.isNotEmpty
                    ? ListView.builder(
                      itemCount: testList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {
                            // Xoá task khỏi database
                          },
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, color: Colors.grey),
                              10.w,
                              Text(
                                AppStr.deletedTask,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          key: Key(index.toString()),
                          child: TaskWidget(),
                        );
                      },
                    )
                    : Center(
                      // Dùng Center để tránh lỗi khi không có task
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Animation Lottie khi không có task
                          FadeIn(
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Lottie.asset(
                                lottieUrl,
                                animate:
                                    testList
                                        .isEmpty, // Chạy animation nếu không có task
                              ),
                            ),
                          ),
                          10.h,

                          /// Text thông báo
                          FadeInUp(
                            from: 30,
                            child: const Text(AppStr.doneAllTask),
                          ),
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
