import 'package:flutter/material.dart';
import 'package:tiktok_ui/screens/home_screen.dart';
import 'package:tiktok_ui/screens/profile_Screen.dart';
import 'package:tiktok_ui/screens/search_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, HomeScreen.routeName);
                },
                color: Colors.white,
                icon: Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, SearchScreen.routeName);
                },
                color: Colors.white,
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.add_circle)),
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.message)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                color: Colors.white,
                icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
