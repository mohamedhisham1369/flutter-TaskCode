import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final IconData icon;

  const DrawerItem({
    super.key,
    required this.title,
    this.isActive = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffFFC268) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? Colors.black : const Color(0xFF9CA3AF),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : const Color(0xFF9CA3AF),
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}