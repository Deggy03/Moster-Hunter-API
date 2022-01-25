
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http1;

import 'nome.dart';


  
class Http1 extends StatefulWidget {
  final int id;


  const Http1({Key? key, required this.id}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _HttpState1 createState() => _HttpState1(id+1);
}

class _HttpState1 extends State<Http1> {
  final int arma;
 

  _HttpState1(this.arma);

  Future<Data1> fetchData() async {
    http1.Response response = await http1.get(Uri.parse(
        'https://mhw-db.com/weapons/'+arma.toString()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Data1.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load character');
    }
  }

  late Future<Data1> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Data1>(
        future: futureData,
        builder: (context, snapshot) {
              
          if (snapshot.hasData) {
            return   Text(snapshot.data!.name);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
