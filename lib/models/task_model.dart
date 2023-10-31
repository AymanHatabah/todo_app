class TaskModel {
  String id;
  String title;
  String Description;
  int date;
  bool isDone;
  String userid;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.Description,
      required this.date,

      this.isDone = false,
        required this.userid

      });
//map to model.......
  TaskModel.fromJson(
    Map<String, dynamic> json,
  ) : this(
            title: json["title"],
            Description: json["Description"],
            date: json["date"],
            id: json["id"],
            isDone: json["isDone"],
  userid: json["userid"]
  );
//model to map
  Map<String, dynamic>toJson(){
    return {
"title":title,
      "Description":Description, //KEY :VALUE,FROM MODEL
      "date":date,
      "id":id,
      "isDone":isDone,
      "userid":userid
    };

  }
}
/*TaskModel fromJson( S) {
    return TaskModel(title: json["title"],

        Description:json["description"], date:json["date"],
    id: json["id"],isDone: json["isDone"]);
  }*/
