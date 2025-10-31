import 'package:flutter/material.dart';
import 'package:flutter_web_task/core/themes/assets.dart';

import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A0A0A),
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Image.asset(
                    Assets.assetsImagesLogo,
                    height: 24,
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2D2D2D)),
            // Navigation Items
            DrawerItem(
                title: 'Items', isActive: true, icon: Icons.dashboard_outlined),
            DrawerItem(title: 'Pricing', icon: Icons.attach_money),
            DrawerItem(title: 'Info', icon: Icons.info_outline),
            DrawerItem(title: 'Tasks', icon: Icons.task_outlined),
            DrawerItem(title: 'Analytics', icon: Icons.analytics_outlined),
            const Spacer(),
            const Divider(color: Color(0xFF2D2D2D)),
            // User Profile
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=33',
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'john@example.com',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
