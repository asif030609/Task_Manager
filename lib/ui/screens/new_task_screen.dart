import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task.dart';
import '../widgets/task_item.dart';
import '../widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TaskItem(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTask(),
      ),
    );
  }

  Widget _buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TaskSummaryCard(title: 'New Task', count: '8'),
            TaskSummaryCard(title: 'New Task', count: '8'),
            TaskSummaryCard(title: 'New Task', count: '8'),
            TaskSummaryCard(title: 'New Task', count: '8'),
          ],
        ),
      ),
    );
  }
}
