import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/widgets/customappbar.dart';
import 'package:todoapp/widgets/customelevatedbutton.dart';

class EditTask extends StatelessWidget {
  EditTask({super.key, required this.index});

  final int index;

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
                        hintText: context.read<TaskProvider>().tasklist[index]
                            ['title'],
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _detail,
                    decoration: InputDecoration(
                        hintText: context.read<TaskProvider>().tasklist[index]
                            ['detail'],
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomElevatedButton(
                    title: 'Update',
                    onPressed: () {
                      context.read<TaskProvider>().editTask(
                          index: index,
                          product: {
                            'title': _title.text,
                            'detail': _detail.text
                          });
                      Navigator.pop(context);
                    }),
                SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                    title: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
