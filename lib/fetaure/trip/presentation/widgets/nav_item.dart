import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const NavItem({super.key, required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF6B7280),
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        if (isActive)
          Container(
            height: 2,
            width: 40,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFA726), Color(0xFFFF8A00)],
              ),
            ),
          ),
      ],
    );
  }
}