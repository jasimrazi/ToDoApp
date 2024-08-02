import 'package:flutter/material.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/screens/addtaskpage.dart';
import 'package:todoapp/screens/edittaskpage.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        backgroundColor: kPrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTask(),
              ));
        },
        child: Icon(
          Icons.add,
          color: kTertiary,
        ),
        shape: CircleBorder(),
        backgroundColor: kPrimary,
      ),
      body: Consumer<TaskProvider>(builder: (context, taskprovider, child) {
        return ListView.builder(
          itemCount: taskprovider.tasklist.length,
          itemBuilder: (context, index) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              elevation: 3,
              child: ListTile(
                title: Text(
                  taskprovider.tasklist[index]['title'],
                  style: TextStyle(color: kPrimary),
                ),
                subtitle: Text(taskprovider.tasklist[index]['detail']),
                trailing: Container(
                  width: 150,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditTask(index: index,),
                                ));
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: kPrimary,
                          )),
                      IconButton(
                          onPressed: () {
                            context.read<TaskProvider>().removeTask(
                                product: taskprovider.tasklist[index]);
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: kPrimary,
                          )),
                      IconButton(
                        onPressed: () {
                          if (context.read<TaskProvider>().isCompleted(
                              taskprovider.tasklist[index]['title'])) {
                            context.read<TaskProvider>().removeCompleted(
                                product: taskprovider.tasklist[index]);
                          } else {
                            context.read<TaskProvider>().addCompleted(
                                product: taskprovider.tasklist[index]);
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
