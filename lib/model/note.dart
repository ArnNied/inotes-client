class Note {
  final String id;
  final String title;
  final String body;
  final int createdAt;
  final int lastUpdated;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.lastUpdated,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: json['created_at'],
      lastUpdated: json['last_updated'],
    );
  }
}
