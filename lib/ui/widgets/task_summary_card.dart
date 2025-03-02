import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
        child: Column(
          children: [
            Text(
              count,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}