import 'package:flutter/material.dart';
import '../models/team_member.dart';
import 'avatar.dart';
import '../theme/app_theme.dart';

class PerformanceCard extends StatelessWidget {
  final TeamMember member;
  final int open;
  final int overdue;
  final int closed;
  final int total;
  final VoidCallback onTap;
  const PerformanceCard({
    super.key,
    required this.member,
    required this.open,
    required this.overdue,
    required this.closed,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppTheme.line),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MemberAvatar(member: member, radius: 15),
                const SizedBox(width: 8),
                Text(
                  member.name,
                  style: const TextStyle(
                    fontFamily: 'Anta',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: CustomPaint(
                      painter: _DonutPainter(
                        open: open,
                        overdue: overdue,
                        closed: closed,
                        total: total,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$total',
                              style: const TextStyle(
                                fontFamily: 'Anta',
                                fontSize: 36,
                              ),
                            ),
                            const Text(
                              'Tasks',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppTheme.muted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 105,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Legend(
                        color: AppTheme.yellow,
                        label: 'Open',
                        value: '$open',
                      ),
                      const SizedBox(height: 24),
                      _Legend(
                        color: AppTheme.red,
                        label: 'Overdue',
                        value: '$overdue',
                      ),
                      const SizedBox(height: 24),
                      _Legend(
                        color: AppTheme.green,
                        label: 'Closed',
                        value: '$closed',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  const _Legend({
    required this.color,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(width: 6),
      Flexible(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(color: AppTheme.muted, fontSize: 15),
              ),
              TextSpan(
                text: '   '
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: AppTheme.ink,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class _DonutPainter extends CustomPainter {
  final int open, overdue, closed, total;
  _DonutPainter({
    required this.open,
    required this.overdue,
    required this.closed,
    required this.total,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        (size.height < size.width ? size.height : size.width) / 2 - 8;
    const gap = 0.10;
    final values = [overdue, closed, open];
    final colors = [AppTheme.red, AppTheme.green, AppTheme.yellow];
    var start = -1.5708;
    for (var i = 0; i < values.length; i++) {
      final sweep = total == 0 ? 0.0 : (values[i] / total) * 6.28318;
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start + gap,
        (sweep - gap * 2).clamp(0.0, 6.28318),
        false,
        paint,
      );
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutPainter old) =>
      old.open != open || old.overdue != overdue || old.closed != closed;
}
