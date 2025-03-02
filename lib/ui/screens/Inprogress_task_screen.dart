import 'package:flutter/material.dart';

import '../widgets/task_item.dart';

class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({super.key});

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top:8,left: 8,right: 8),
            child: TaskItem(),
          );
        },
      ),
    );
  }
}
