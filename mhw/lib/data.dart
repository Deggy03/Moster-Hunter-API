

class Data {
  // ignore: non_constant_identifier_names
  int id;
  String type;
  String name;
  int rarity;
  String damageType;
//  Array image;

 

  Data({
      required this.name,
      required this.type,
      required this.id,
      required this.rarity,
      required this.damageType,
      //required this.image,
 

  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        rarity: json['rarity'],
        type: json['type'],
        name: json['name'],
        damageType: json['damageType'],
    //  image: json['assets.image'],
    

    );   
  }
}
