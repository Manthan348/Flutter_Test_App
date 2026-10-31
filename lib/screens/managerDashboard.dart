import 'package:flutter/material.dart';
import '../components/stat_card.dart';
import '../components/avatar.dart';
import '../data/mock_data.dart';
import '../models/task.dart';
import '../models/team_member.dart';
import '../routes.dart';
import '../theme/app_theme.dart';
import '../components/duration_dropdown.dart';

class Managerdashboard extends StatefulWidget {
  const Managerdashboard({super.key});
  @override
  State<Managerdashboard> createState() => _ManagerdashboardState();
}

class _ManagerdashboardState extends State<Managerdashboard> {
  String duration = 'Today';
  String selectedMember = 'Akhil Bisht';
  int dashboardTab = 1;

  int count(TaskStatus status) =>
      MockData.tasks.where((t) => t.status == status).length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final members = MockData.members;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        title: const Text(
          'RESIDE',
          style: TextStyle(
            fontSize: 17,
            letterSpacing: 1.4,
            fontFamily: 'Anta',
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu, size: 27)),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 17, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (v) => setState(() => selectedMember = v),
                    color: AppTheme.canvas,
                    child: Container(
                      padding: const EdgeInsets.all(3.3),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.line),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          MemberAvatar(
                            member: members.firstWhere(
                              (m) => m.name == selectedMember,
                            ),
                            radius: 18,
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.keyboard_arrow_down, size: 20),
                        ],
                      ),
                    ),
                    itemBuilder: (_) => members
                        .map(
                          (m) => PopupMenuItem(
                            value: m.name,
                            child: Row(
                              children: [
                                MemberAvatar(member: m, radius: 15),
                                const SizedBox(width: 10),
                                Text(m.name),
                                if (m.name == selectedMember) ...[
                                  const Spacer(),
                                  const Icon(Icons.check, size: 18),
                                ],
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const Divider(height: 35),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.line),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    _DashboardTab(
                      label: 'My Tasks',
                      selected: dashboardTab == 0,
                      onTap: () => setState(() => dashboardTab = 0),
                    ),
                    _DashboardTab(
                      label: 'Teams',
                      selected: dashboardTab == 1,
                      onTap: () => setState(() => dashboardTab = 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Tasks',
                      style: TextStyle(fontSize: 18, fontFamily: 'Anta'),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 30,
                    child: DurationDropdown(
                      value: duration,
                      onChanged: (v) => setState(() => duration = v),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      count: dashboardTab == 1 ? 10 : 2,
                      label: 'Open',
                      icon: Icons.insert_drive_file_outlined,
                      tint: const Color(0xFFFFF8DF),
                      iconColor: AppTheme.yellow,
                      onTap: () => _openTasks(context, 0),
                    ),
                  ),
                  const SizedBox(width: 23),
                  Expanded(
                    child: StatCard(
                      count: dashboardTab == 1 ? 6 : 1,
                      label: 'Overdue',
                      icon: Icons.access_time,
                      tint: const Color(0xFFFFEDF0),
                      iconColor: const Color(0xFFFF6472),
                      onTap: () => _openTasks(context, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              StatCard(
                count: dashboardTab == 1 ? 4 : 1,
                label: 'Closed',
                icon: Icons.check,
                tint: const Color(0xFFEFFFEC),
                iconColor: const Color(0xFF75D94D),
                onTap: () => _openTasks(context, 2),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.teamPerformance),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  side: const BorderSide(color: AppTheme.dark),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'VIEW TEAM PERFORMANCE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.ink,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right, size: 22, color: AppTheme.ink),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Properties',
                style: TextStyle(fontSize: 18, fontFamily: 'Anta'),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      count: 8,
                      label: 'All listings',
                      icon: Icons.home_outlined,
                      tint: const Color(0xFFEFF9EC),
                      iconColor: AppTheme.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      count: 5,
                      label: 'Under Onboarding',
                      icon: Icons.add_home_work_outlined,
                      tint: const Color(0xFFEFF3FF),
                      iconColor: const Color(0xFF243A9B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Opportunities',
                style: TextStyle(fontSize: 18, fontFamily: 'Anta'),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _OpportunityCard(
                      count: 12,
                      label: 'To rent-in',
                      extraCount: 10,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _OpportunityCard(
                      count: 4,
                      label: 'To lease-out',
                      extraCount: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openTasks(BuildContext context, int index) =>
      Navigator.pushNamed(context, AppRoutes.teamTasks, arguments: index);
}

class _DashboardTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _DashboardTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppTheme.dark,
            fontSize: 14,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}

class _OpportunityCard extends StatelessWidget {
  final int count;
  final String label;
 final int extraCount;

  const _OpportunityCard({
    required this.count,
    required this.label,
    required this.extraCount,
  });

  @override
  Widget build(BuildContext context) { 
    final members = MockData.members.take(2).toList();

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
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
              
              SizedBox(
                width: 84,
                height: 32,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: _buildAvatar(members[0]),
                    ),
                    Positioned(
                      left: 17,
                      top: 0,
                      child: _buildAvatar(members[1]),
                    ),

                    // Additional members count
                    Positioned(
                      left: 34,
                      top: 0,
                      child: Container(
                        width: 39,
                        height: 39,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppTheme.line,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.3,
                          ),
                        ),
                        child: Text(
                          '+$extraCount',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF777777),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            label,
            style: const TextStyle(color: AppTheme.muted, fontSize: 15),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAvatar(TeamMember member) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.3)
      ),
      child: MemberAvatar(
        member: member,
        radius: 17,
      ),
    );
  }
}
