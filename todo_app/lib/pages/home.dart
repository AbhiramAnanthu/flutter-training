import 'package:flutter/material.dart';
import 'package:todo_app/models/taskModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Taskmodel> tasks = [];

  void _setComplete(String title) {
    setState(() {
      final task = tasks.firstWhere((item) => item.title == title,
          orElse: () => Taskmodel(title: '', isCompleted: false));

      if (task.title.isNotEmpty) {
        task.isCompleted = true;
        tasks
            .where((item) => item.title != title)
            .forEach((item) => item.isCompleted = false);
      }
    });
  }

  void _createTask() {
    setState(() {
      String title = _controller.text;
      Taskmodel newTask = Taskmodel(title: title);
      tasks.add(newTask);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _addTasksField(),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(tasks[index].title),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _setComplete(tasks[index].title);
                              },
                              icon: Icon(
                                Icons.check,
                                color: tasks[index].isCompleted
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _addTasksField() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          fillColor: Colors.white,
          filled: true,
          hintText: "Make Breakfast",
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Container(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: _createTask,
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "ToDo Application",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
