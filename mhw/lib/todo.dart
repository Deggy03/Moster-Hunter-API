//Degano Riccardo 24/01/2022


import 'package:flutter/material.dart';
import 'package:mhw/http.dart';
import 'package:mhw/http1.dart';

class Todo {
  final int id;
  final int nome;

  const Todo(this.id, this.nome);
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Armi'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(child: Column(children: <Widget>[Http1(id: index,),]),),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                  arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Column(children: <Widget>[Http1(id: todo.id,),]),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Column(children: <Widget>[Http(id: todo.id),]),)
        
      ),
    );
  }
}