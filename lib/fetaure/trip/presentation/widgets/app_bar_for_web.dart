import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/themes/assets.dart';

import 'nav_item.dart';

class AppBarForWeb extends StatelessWidget implements PreferredSizeWidget {
  const AppBarForWeb({
    super.key,
    required this.horizontalPadding,
  });

  final double horizontalPadding;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        color: const Color(0xFF000000),
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
        child: Row(
          children: [
            Image.asset(
              Assets.assetsImagesLogo,
              height: 150,
              width: 100,
            ),

            const Spacer(),
            // Navigation items
            const NavItem(title: 'Items', isActive: true),
            const SizedBox(width: 32),
            const NavItem(title: 'Pricing'),
            const SizedBox(width: 32),
            const NavItem(title: 'Info'),
            const SizedBox(width: 32),
            const NavItem(title: 'Tasks'),
            const SizedBox(width: 32),
            const NavItem(title: 'Analytics'),
            const SizedBox(width: 24),
            VerticalDivider(
              color: Color(0xff262626),
              thickness: 1,
              width: 1,
              indent: 8,
              endIndent: 8,
            ),
            const SizedBox(width: 24),
            IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon:
                  const Icon(Icons.notifications_outlined, color: Colors.white),
              onPressed: () {},
            ),
            const SizedBox(width: 16),
            VerticalDivider(
              color: Color(0xff484848),
              thickness: 1,
              width: 1,
              indent: 8,
              endIndent: 8,
            ),
            const SizedBox(width: 16),
            const CircleAvatar(
              radius: 18,
              backgroundImage: CachedNetworkImageProvider(
               "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face"
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
            const Icon(Icons.keyboard_arrow_down,
                color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
