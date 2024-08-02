import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:todoapp/widgets/customappbar.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Completed Task'),
      body: Consumer<TaskProvider>(builder: (context, taskprovider, child) {
        return ListView.builder(
          itemCount: taskprovider.completedlist.length,
          itemBuilder: (context, index) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              elevation: 3,
              child: ListTile(
                title: Text(
                  taskprovider.completedlist[index]['title'],
                  style: TextStyle(color: kPrimary),
                ),
                subtitle: Text(taskprovider.completedlist[index]['detail']),
                trailing: Container(
                  width: 150,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: kPrimary,
                          )),
                      IconButton(
                          onPressed: () {
                            context.read<TaskProvider>().removeTask(
                                product: taskprovider.completedlist[index]);
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: kPrimary,
                          )),
                      IconButton(
                        onPressed: () {
                          if (context.read<TaskProvider>().isCompleted(
                              taskprovider.completedlist[index]['title'])) {
                            context.read<TaskProvider>().removeCompleted(
                                product: taskprovider.completedlist[index]);
                          } else {
                            context.read<TaskProvider>().addCompleted(
                                product: taskprovider.completedlist[index]);
                          }
                        },
                        icon: Icon(
                          context.read<TaskProvider>().isCompleted(
                                  taskprovider.tasklist[index]['title'])
                              ? Icons.check_circle
                              : Icons.check_circle_outline_outlined,
                          color: kPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
