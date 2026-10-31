enum TaskStatus { open, overdue, closed }

class TeamTask {
  final String title;
  final String assignee;
  final TaskStatus status;
  final String dueLabel;
  final DateTime createdAt;

  const TeamTask({
    required this.title,
    required this.assignee,
    required this.status,
    required this.dueLabel,
    required this.createdAt,
  });
}
