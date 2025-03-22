// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();
  int? editingIndex; // To keep track of the task being edited
// Add a task to the list
  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  // Remove a task from the list
  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Edit a task
  void editTask(int index) {
    taskController.text =
        tasks[index]; // Set the text field to the current task
    setState(() {
      editingIndex = index; // Mark the task as being edited
    });
  }

  // Save the edited task
  void saveEditedTask() {
    if (taskController.text.isNotEmpty && editingIndex != null) {
      setState(() {
        tasks[editingIndex!] = taskController.text; // Update the task
        taskController.clear();
        editingIndex = null; // Reset the editing index
      });
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText:
                    editingIndex == null ? 'Enter your task' : 'Edit your task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Add or save button
            ElevatedButton(
              onPressed: editingIndex == null ? addTask : saveEditedTask,
              child: Text(editingIndex == null ? 'Add Task' : 'Save Changes'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => editTask(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeTask(index),
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
}
