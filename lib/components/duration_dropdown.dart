import 'package:flutter/material.dart';
import 'package:flutter_test_application/theme/app_theme.dart';

const durationOptions = [
  'Today',
  'Week',
  'Month',
  'Quarter',
  'Annual',
  'Till Date',
  'Date Range',
];

class DurationDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  const DurationDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.dark),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20, color: AppTheme.ink),
          items: durationOptions
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.ink,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}
