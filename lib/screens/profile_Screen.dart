import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok_ui/models/post_model.dart';
import 'package:tiktok_ui/models/user_model.dart';
import 'package:tiktok_ui/widgets/custom_video_player_preview.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)!.settings.arguments as User?;
    user = user ??= User.users[0];

    List<Post> posts = Post.posts.where((post) {
      return post.user.id == user!.id;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '@${user.username}',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ProfileInformation(user: user),
            _ProfileContent(posts: posts)
          ],
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({super.key, required this.posts});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.grid_view_rounded),
            ),
            Tab(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            )
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              // first tab
              GridView.builder(
                  itemCount: posts.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 9 / 16),
                  itemBuilder: (context, index) {
                    return CustomVideoPlayerPreview(
                      post: posts[index],
                    );
                  }),
              // second tab
              Tab(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class _ProfileInformation extends StatelessWidget {
  const _ProfileInformation({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(user.imagePath),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75.0),
          child: Row(
            children: [
              _buildUserInfo(context, 'Following', '${user.followings}'),
              _buildUserInfo(context, 'Followers', '${user.followers}'),
              _buildUserInfo(context, 'Likes', '${user.likes}')
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF006E), fixedSize: Size(240, 45)),
                child: Text(
                  'Follow',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, fixedSize: Size(50, 45)),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )),
            )
          ],
        )
      ],
    );
  }

  Expanded _buildUserInfo(BuildContext context, String type, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            type,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
