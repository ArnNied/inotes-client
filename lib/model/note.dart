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
      createdAt: int.parse(json['created_at']),
      lastUpdated: int.parse(json['last_updated']),
    );
  }
}
