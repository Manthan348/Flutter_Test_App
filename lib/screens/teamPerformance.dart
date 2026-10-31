import 'package:flutter/material.dart';
import '../components/duration_dropdown.dart';
import '../components/performance_card.dart';
import '../data/mock_data.dart';
import '../models/task.dart';
import '../routes.dart';

class Teamperformance extends StatefulWidget {
  const Teamperformance({super.key});
  @override
  State<Teamperformance> createState() => _TeamperformanceState();
}

class _TeamperformanceState extends State<Teamperformance> {
  String duration = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 21),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Team Performance',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            DurationDropdown(
              value: duration,
              onChanged: (v) => setState(() => duration = v),
            ),
            const SizedBox(height: 22),
            ...MockData.members.map((member) {
              final tasks = MockData.tasks.where(
                (t) => t.assignee == member.name,
              );
              final open = tasks
                  .where((t) => t.status == TaskStatus.open)
                  .length;
              final overdue = tasks
                  .where((t) => t.status == TaskStatus.overdue)
                  .length;
              final closed = tasks
                  .where((t) => t.status == TaskStatus.closed)
                  .length;
              return Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: PerformanceCard(
                  member: member,
                  open: open,
                  overdue: overdue,
                  closed: closed,
                  total: open + overdue + closed,
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.teamTasks,
                    arguments: {'member': member.name, 'tab': 0},
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
