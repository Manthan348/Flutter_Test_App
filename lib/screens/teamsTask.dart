import 'package:flutter/material.dart';
import '../components/task_card.dart';
import '../components/duration_dropdown.dart';
import '../data/mock_data.dart';
import '../models/task.dart';
import '../theme/app_theme.dart';

class TeamsTaskScreen extends StatefulWidget {
  const TeamsTaskScreen({super.key});
  @override
  State<TeamsTaskScreen> createState() => _TeamsTaskScreenState();
}

class _TeamsTaskScreenState extends State<TeamsTaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabs;
  String? memberFilter;
  String duration = 'Today';
  bool ascending = true;
  String sortBy = 'Due date';

  @override
  void initState() {
    super.initState();
    tabs = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final initialTab = args is int
        ? args.clamp(0, 2)
        : (args is Map && args['tab'] is int
              ? (args['tab'] as int).clamp(0, 2)
              : 0);
    final selectedMember = args is Map ? args['member'] as String? : null;
    if (tabs.index != initialTab) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && tabs.index != initialTab) tabs.animateTo(initialTab);
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 21),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Team’s Task',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: TabBar(
            controller: tabs,
            indicatorColor: AppTheme.ink,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            unselectedLabelColor: AppTheme.muted,
            labelStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            tabs: const [
              Tab(text: 'OPEN'),
              Tab(text: 'OVERDUE'),
              Tab(text: 'CLOSED'),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showFilters(context, selectedMember),
                    icon: const Icon(Icons.filter_alt_outlined, size: 18),
                    label: const Text('Filters'),
                    style: _actionStyle,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showSort,
                    icon: const Icon(Icons.swap_vert, size: 20),
                    label: const Text('Sort'),
                    style: _actionStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabs,
              children: [
                TaskStatus.open,
                TaskStatus.overdue,
                TaskStatus.closed,
              ].map((status) => _taskList(status, selectedMember)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle get _actionStyle => OutlinedButton.styleFrom(
    foregroundColor: AppTheme.ink,
    side: const BorderSide(color: AppTheme.line),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    minimumSize: const Size(0, 38),
    textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
  );

  Widget _taskList(TaskStatus status, String? routeMember) {
    var tasks = MockData.tasks.where((t) => t.status == status).toList();
    final member = memberFilter ?? routeMember;
    if (member != null) {
      tasks = tasks.where((t) => t.assignee == member).toList();
    }
    tasks.sort(
      (a, b) => sortBy == 'Task name'
          ? a.title.compareTo(b.title)
          : a.createdAt.compareTo(b.createdAt),
    );
    if (!ascending) tasks = tasks.reversed.toList();
    if (tasks.isEmpty) {
      return const Center(
        child: Text('No tasks found', style: TextStyle(color: AppTheme.muted)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(14, 2, 14, 20),
      itemCount: tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (_, i) => TaskCard(task: tasks[i]),
    );
  }

  void _showFilters(BuildContext context, String? routeMember) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheet) => Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            22,
            20,
            MediaQuery.viewInsetsOf(context).bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 18),
              const Text(
                'Team member',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String?>(
                value: memberFilter,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('All members'),
                  ),
                  ...MockData.members.map(
                    (m) => DropdownMenuItem(value: m.name, child: Text(m.name)),
                  ),
                ],
                onChanged: (v) => setSheet(() => memberFilter = v),
              ),
              const SizedBox(height: 18),
              const Text(
                'Duration',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DurationDropdown(
                value: duration,
                onChanged: (v) => setSheet(() => duration = v),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setSheet(() {
                        memberFilter = null;
                        duration = 'Today';
                      }),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Apply'),
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

  void _showSort() {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheet) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sort tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              RadioListTile<String>(
                value: 'Due date',
                groupValue: sortBy,
                title: const Text('Due date'),
                onChanged: (v) => setSheet(() => sortBy = v!),
              ),
              RadioListTile<String>(
                value: 'Task name',
                groupValue: sortBy,
                title: const Text('Task name'),
                onChanged: (v) => setSheet(() => sortBy = v!),
              ),
              SwitchListTile(
                value: ascending,
                title: const Text('Ascending order'),
                onChanged: (v) => setSheet(() => ascending = v),
              ),
              FilledButton(
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
