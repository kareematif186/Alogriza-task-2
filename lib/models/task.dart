class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({

   this.color,
    this.note,
    this.endTime,
    this.startTime,
    this.title,
    this.isCompleted,
    this.id,
    this.date,
    this.remind,
    this.repeat,



});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'note': this.note,
      'isCompleted': this.isCompleted,
      'date': this.date,
      'startTime': this.startTime,
      'endTime': this.endTime,
      'color': this.color,
      'remind': this.remind,
      'repeat': this.repeat,
    };
  }

 Task.fromJson(Map<String, dynamic> Json) {
      id= Json['id'] as int;
      title= Json['title'] as String;
      note= Json['note'] as String;
      isCompleted= Json['isCompleted'] as int;
      date= Json['date'] as String;
      startTime= Json['startTime'] ;
      endTime= Json['endTime'] ;
      color= Json['color'] as int;
      remind= Json['remind'] as int;
      repeat= Json['repeat'] as String;
  }
}
