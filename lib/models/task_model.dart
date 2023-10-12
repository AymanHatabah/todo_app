class TaskModel {
  String id;
  String title;
  String Description;
  int date;
  bool isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.Description,
      required this.date,
      this.isDone = false});
//map to model.......
  TaskModel.fromJson(
    Map<String, dynamic> json,
  ) : this(
            title: json["title"],
            Description: json["Description"],
            date: json["date"],
            id: json["id"],
            isDone: json["isDone"]);
//model to map
  Map<String, dynamic>toJson(){
    return {
"title":title,
      "Description":Description, //KEY :VALUE,FROM MODEL
      "date":date,
      "id":id,
      "isDone":isDone,
    };

  }
}
/*TaskModel fromJson( S) {
    return TaskModel(title: json["title"],

        Description:json["description"], date:json["date"],
    id: json["id"],isDone: json["isDone"]);
  }*/
