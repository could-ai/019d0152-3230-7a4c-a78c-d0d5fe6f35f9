import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  const SimpleBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for 7 days
    final List<double> values = [0.4, 0.6, 0.5, 0.8, 0.3, 0.9, 0.7];
    final List<String> labels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(values.length, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Tooltip/Value representation
            Text(
              '${(values[index] * 100).toInt()}M',
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 4),
            // Bar
            Container(
              width: 30,
              height: 200 * values[index],
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(index == 5 ? 1.0 : 0.6), // Highlight highest
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ),
            const SizedBox(height: 8),
            // Label
            Text(
              labels[index],
              style: TextStyle(
                fontWeight: index == 5 ? FontWeight.bold : FontWeight.normal,
                color: index == 5 ? Theme.of(context).colorScheme.primary : Colors.grey.shade700,
              ),
            ),
          ],
        );
      }),
    );
  }
}
