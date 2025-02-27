import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/utils/app_str.dart';

class RepTextTitle extends StatelessWidget {
  const RepTextTitle({
    super.key,
    required this.controller,
    this.isForDescription = false,
  });

  final TextEditingController controller;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 6 : null,
          cursorHeight: !isForDescription ? 60 : null,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            counter: Container(),
            hintText: isForDescription ? AppStr.addNote : '',
            prefixIcon:
                isForDescription
                    ? const Icon(Icons.bookmark_border, color: Colors.grey)
                    : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),

          onFieldSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
    );
  }
}