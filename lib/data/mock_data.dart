import '../models/team_member.dart';
import '../models/task.dart';

class MockData {
  static const members = <TeamMember>[
    TeamMember('Akhil Bisht', 'AB', 'https://i.pravatar.cc/100?img=12'),
    TeamMember('Bilal Shaikh', 'BS', 'https://i.pravatar.cc/100?img=13'),
    TeamMember('Deepak Singh', 'DS', 'https://i.pravatar.cc/100?img=14'),
    TeamMember('Hemant Kumar', 'HK', ''),
  ];

  static final tasks = <TeamTask>[
    TeamTask(
      title:
          'Check if the Oberoi Splendors is available this week with the keys.',
      assignee: 'Akhil Bisht',
      status: TaskStatus.open,
      dueLabel: 'Today 4:30PM',
      createdAt: DateTime(2026, 10, 30),
    ),
    TeamTask(
      title:
          'Create a Facebook ad campaign targeting young professionals in the city.',
      assignee: 'Akhil Bisht',
      status: TaskStatus.open,
      dueLabel: 'Today 4:30PM',
      createdAt: DateTime(2026, 10, 29),
    ),
    TeamTask(
      title: 'Check if the apartment is available',
      assignee: 'Bilal Shaikh',
      status: TaskStatus.open,
      dueLabel: 'Today 5:00PM',
      createdAt: DateTime(2026, 10, 28),
    ),
    TeamTask(
      title: 'Schedule a property visit with the interested customer',
      assignee: 'Deepak Singh',
      status: TaskStatus.open,
      dueLabel: 'Tomorrow 11:00AM',
      createdAt: DateTime(2026, 10, 27),
    ),
    TeamTask(
      title: 'Follow up with the owner regarding the lease agreement',
      assignee: 'Hemant Kumar',
      status: TaskStatus.overdue,
      dueLabel: 'Overdue 2 days',
      createdAt: DateTime(2026, 10, 25),
    ),
    TeamTask(
      title: 'Verify documents for the shortlisted property',
      assignee: 'Akhil Bisht',
      status: TaskStatus.overdue,
      dueLabel: 'Overdue 2 days',
      createdAt: DateTime(2026, 10, 24),
    ),
    TeamTask(
      title: 'Confirm the apartment availability and pricing',
      assignee: 'Bilal Shaikh',
      status: TaskStatus.overdue,
      dueLabel: 'Overdue 3 days',
      createdAt: DateTime(2026, 10, 23),
    ),
    TeamTask(
      title: 'Share property photographs with the customer',
      assignee: 'Deepak Singh',
      status: TaskStatus.overdue,
      dueLabel: 'Overdue 4 days',
      createdAt: DateTime(2026, 10, 22),
    ),
    TeamTask(
      title: 'Update listing details and publish the property',
      assignee: 'Akhil Bisht',
      status: TaskStatus.closed,
      dueLabel: 'Closed',
      createdAt: DateTime(2026, 10, 20),
    ),
    TeamTask(
      title: 'Arrange keys for the scheduled property visit',
      assignee: 'Bilal Shaikh',
      status: TaskStatus.closed,
      dueLabel: 'Closed',
      createdAt: DateTime(2026, 10, 19),
    ),
    TeamTask(
      title: 'Contact the customer to confirm requirements',
      assignee: 'Deepak Singh',
      status: TaskStatus.closed,
      dueLabel: 'Closed',
      createdAt: DateTime(2026, 10, 18),
    ),
    TeamTask(
      title: 'Complete the onboarding checklist for the new listing',
      assignee: 'Hemant Kumar',
      status: TaskStatus.closed,
      dueLabel: 'Closed',
      createdAt: DateTime(2026, 10, 17),
    ),
  ];
}
