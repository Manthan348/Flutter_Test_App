import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final int count;
  final String label;
  final IconData icon;
  final Color tint;
  final Color iconColor;
  final VoidCallback? onTap;
  const StatCard({
    super.key,
    required this.count,
    required this.label,
    required this.icon,
    required this.tint,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 15),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: tint,
                    child: Icon(icon, color: iconColor, size: 16),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Text(
                label,
                style: const TextStyle(color: Color(0xFF8D8D8D), fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
