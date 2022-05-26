class Pokemon {
  final String name;
  final String img;
  final List<String> type;
  final int id;
  final String num;
  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        img: json['img'],
        id: json['id'],
        num: json['num'],
        type: (json['type'] as List<dynamic>)
            .map(
              (e) => e as String,
            )
            .toList());
  }

  Pokemon({
    required this.name,
    required this.img,
    required this.type,
    required this.id,
    required this.num,
  });
}
