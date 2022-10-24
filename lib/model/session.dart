class Session {
  final String session;

  Session({
    required this.session,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      session: json['session'],
    );
  }
}
