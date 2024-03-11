import 'package:flutter/material.dart';

// class CAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String PageName;
  const CAppBar({super.key, required this.PageName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFF199A8E),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Column(
            mainAxisAlignment: MainAxisAlignment
                .start, // Positions the elements in the middle of the column
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns the text to the left
            children: [
              Row(
                children: [Text("$PageName", style: TextStyle(fontSize: 20))],
              ),
            ]));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
