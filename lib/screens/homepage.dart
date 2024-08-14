import 'package:flutter/material.dart';
import 'package:todoapp/provider/database_provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/screens/addtaskpage.dart';
import 'package:todoapp/screens/edittaskpage.dart';
import 'package:todoapp/utils/contants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DBServiceProvider>().getData();
    });
  }

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
              )).then(
            (value) {
              context.read<DBServiceProvider>().getData();
            },
          );
        },
        child: Icon(
          Icons.add,
          color: kTertiary,
        ),
        shape: CircleBorder(),
        backgroundColor: kPrimary,
      ),
      body: Consumer<DBServiceProvider>(
          builder: (context, dbserviceprovider, child) {
        return ListView.builder(
          itemCount: dbserviceprovider.taskdata.length,
          itemBuilder: (context, index) {
            List tasks = dbserviceprovider.taskdata;
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              elevation: 3,
              child: ListTile(
                title: Text(
                  tasks[index]['title'],
                  style: TextStyle(color: kPrimary),
                ),
                subtitle: Text(tasks[index]['detail']),
                trailing: Container(
                  width: 150,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditTask(
                                    index: index,
                                  ),
                                ));
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: kPrimary,
                          )),
                      IconButton(
                          onPressed: () {
                            context
                                .read<DBServiceProvider>()
                                .removeData(tasks[index]['id']);
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: kPrimary,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_circle_outline_outlined,
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
