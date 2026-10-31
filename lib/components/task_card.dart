import 'package:flutter/material.dart';
import '../models/task.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import 'avatar.dart';

class TaskCard extends StatelessWidget {
  final TeamTask task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final member = MockData.members.firstWhere((m) => m.name == task.assignee);
    final Color statusColor = task.status == TaskStatus.open
        ? AppTheme.blue
        : task.status == TaskStatus.overdue
        ? AppTheme.red
        : AppTheme.green;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(13, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE9E9E9)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(Icons.flag, color: Color(0xFFEACB29), size: 15),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF363636),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              MemberAvatar(member: member, radius: 9),
              const SizedBox(width: 6),
              Text(
                'Mr. ${task.assignee}',
                style: const TextStyle(fontSize: 11, color: Color(0xFF777777)),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Text(
                'To do',
                style: TextStyle(fontSize: 12, color: AppTheme.muted),
              ),
              const SizedBox(width: 7),
              const Text('•', style: TextStyle(color: Color(0xFFD0D0D0))),
              const SizedBox(width: 7),
              Flexible(
                child: Text(
                  task.dueLabel,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
