import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _titleTEController=TextEditingController();
  final TextEditingController _descriptionTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(context),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28,),
              Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
                maxLines: 5,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: (){}, child:Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
