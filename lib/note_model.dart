class NoteModel {
  String title;
  String body;

  NoteModel({this.title, this.body});

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, Object> toJson() {
    return {'title': title, 'body': body};
  }
}
