import 'package:flutter/material.dart';
import 'package:lazytv/src/widgets/search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;

  CustomAppBar({this.title = '', this.isBack = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10), 
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isBack ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)
          ) :InkWell(
            onTap: () {
              showSearchDialog(context);
            },
            child: const Icon(Icons.search)
          ),
          InkWell(
            onTap: () {
              showSearchDialog(context);
            },
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          
          const CircleAvatar(
            backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/5226773?v=4'),
          )
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size(double.infinity, double.maxFinite);
}