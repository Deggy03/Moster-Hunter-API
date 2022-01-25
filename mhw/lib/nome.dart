//Degano Riccardo 24/01/2022

class Data1 {
  // ignore: non_constant_identifier_names
  int id;
  String name;


  Data1({
      required this.name,
      required this.id,

  });

  factory Data1.fromJson(Map<String, dynamic> json) {
    return Data1(
        id: json['id'],
        name: json['name'],

    );   
  }
}