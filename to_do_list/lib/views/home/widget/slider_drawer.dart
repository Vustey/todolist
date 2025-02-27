import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/extensions/space_exs.dart';
import 'package:to_do_list/utils/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key});

  final List<String> texts = ["Home", "Profile", "Details", "Settings"];
  final List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.details,
    Icons.settings,
  ];

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50, // Tăng kích thước ảnh đại diện
            backgroundImage: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg",
            ),
          ),
          8.h,
          Text("Cristiano Ronaldo", style: textTheme.displayMedium),
          Text("Football Player", style: textTheme.displaySmall),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: widget.texts.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    print(widget.texts[index] + " Tap to navigate");
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: ListTile(
                      leading: Icon(
                        widget.icons[index],
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        widget.texts[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
