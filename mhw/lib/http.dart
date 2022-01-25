//Degano Riccardo 24/01/2022

import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data.dart';



class Http extends StatefulWidget {
  final int id;


  const Http({Key? key, required this.id}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _HttpState createState() => _HttpState(id+1);
}

class _HttpState extends State<Http> {
  final int arma;
 

  _HttpState(this.arma);

  Future<Data> fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://mhw-db.com/weapons/'+arma.toString()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Data.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weapons');
    }
  }

  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Data>(
        future: futureData,
        builder: (context, snapshot) {
          
     
        
         String _stampa = (

              '\nName: ' +
              snapshot.data!.name +
              '\nTipo: ' +
              snapshot.data!.type +
              '\nRarità: ' +
             snapshot.data!.rarity.toString() +       
              '\nTipo di Danno: ' +
              snapshot.data!.damageType 
              
          );
          if (snapshot.hasData) {
            return   Text(_stampa);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
