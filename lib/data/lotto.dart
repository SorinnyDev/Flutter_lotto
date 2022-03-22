
class Lotto {
  int? id;
  String numbers = '';
  String? date;

  Lotto({
    this.id,
    required this.numbers,
    this.date,
  });

  // Lotto.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   numbers = json['numbers'];
  //   date = json['date'];
  // }

  Lotto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    numbers = map['numbers'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numbers': numbers,
      'date': date,
    };
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (id != null) {
  //     data['id'] = id;
  //   }
  //   data['numbers'] = this.numbers;
  //   data['date'] = this.date;
  //   return data;
  // }
}