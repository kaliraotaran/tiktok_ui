import 'package:flutter/material.dart';
import 'package:tiktok_ui/models/post_model.dart';
import 'package:tiktok_ui/widgets/custom_bottom_app_bar.dart';
import 'package:tiktok_ui/widgets/custom_video_player.dart';
//import 'package:video_player/video_player.dart';
//import 'package:visibility_detector/visibility_detector.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    List<Post> posts = Post.posts;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _CustomAppbar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: posts.map((post) {
            return CustomVideoPlayer(
              post: post,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  _CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(context, 'For You'),
          _buildButton(context, 'Following')
        ],
      ),
    );
  }

  TextButton _buildButton(BuildContext context, String text) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(fixedSize: const Size(100, 50)),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
