import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/themes/assets.dart';

class AppBarMobile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMobile({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF000000),
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Image.asset(
        Assets.assetsImagesLogo,
        height: 82,
        width: 40,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: CachedNetworkImageProvider(
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face"),
          ),
        ),
      ],
    );
  }
}
