import 'package:flutter/material.dart';
import '../models/team_member.dart';

class MemberAvatar extends StatelessWidget {
  final TeamMember? member;
  final double radius;
  const MemberAvatar({super.key, this.member, this.radius = 13});

  @override
  Widget build(BuildContext context) {
    final imageUrl = member?.avatarUrl?.trim() ?? '';

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF0F1F3),
        border: Border.all(color: const Color(0xFFD9DDE3), width: 1),
      ),
      child: ClipOval(
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildInitials();
                },
              )
            : _buildInitials(),
      ),
    );
  }

  Widget _buildInitials() {
    if (member == null) {
      return const Icon(Icons.person, size: 15, color: Color(0xFF777777));
    }

    return Center(
      child: Text(
        member!.initials,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF252525),
        ),
      ),
    );
  }
}
