//Degano Riccardo 24/01/2022
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mhw/todo.dart';



class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) :  super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TodosScreen(
          // ignore: prefer_const_constructors
          todos: List.generate(1306,(i) => Todo( i, i)
            
          ),
            
          ),
          ),
          
        );
 
    
  }
}