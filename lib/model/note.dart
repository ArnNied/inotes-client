class NoteModel {
  final String id;
  final String title;
  final String body;
  final int createdAt;
  final int lastUpdated;

  NoteModel({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.lastUpdated,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: json["created_at"] is String
          ? int.parse(json["created_at"])
          : json["created_at"],
      lastUpdated: json["last_updated"] is String
          ? int.parse(json["last_updated"])
          : json["last_updated"],
    );
  }
}
