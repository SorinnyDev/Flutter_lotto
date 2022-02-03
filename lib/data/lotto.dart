
class Lotto {
  String title;
  String memo;
  String category;
  int color;
  int? done;
  int date;
  int? id;

  Lotto({
    required this.title,
    required this.memo,
    required this.category,
    required this.color,
    this.done,
    required this.date,
    this.id
  });
}