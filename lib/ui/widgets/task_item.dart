import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title: Text('Title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description'),
            Text(
              'Date:12/12/24',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Chip(
                  label: Text('New'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                ),
                Spacer(),
                Wrap(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}