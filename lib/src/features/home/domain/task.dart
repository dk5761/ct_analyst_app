class Task {
  Task({
    required this.title,
    required this.imageUrl,
    required this.url,
  });

  final String title;
  final String imageUrl;
  final String url;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json["title"],
        imageUrl: json["imageUrl"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imageURL": imageUrl,
        "url": url,
      };
}
