import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/widgets/customappbar.dart';
import 'package:todoapp/widgets/customelevatedbutton.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  TextEditingController _title = TextEditingController();
  TextEditingController _detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                    controller: _title,
                    decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _detail,
                    decoration: InputDecoration(
                        hintText: 'Detail',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                title: 'ADD',
                onPressed: () {
                  context.read<TaskProvider>().addTask(
                      product: {'title': _title.text, 'detail': _detail.text});
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
