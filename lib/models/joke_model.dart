class Joke{
    List<dynamic> categories;
    DateTime createdAt;
    String iconUrl;
    String id;
    DateTime updatedAt;
    String url;
    String value;

    Joke({
        required this.categories,
        required this.createdAt,
        required this.iconUrl,
        required this.id,
        required this.updatedAt,
        required this.url,
        required this.value,
    });
    factory Joke.fromJson(Map<String,dynamic> json)=>Joke(
      categories: List<dynamic>.from(json["categories"].map((x)=>x)),
      createdAt: DateTime.parse(json["created_at"]),
      iconUrl: json["icon_url"],
      id: json["id"],
      updatedAt: DateTime.parse(json["updated_at"]),
      url: json["url"],
      value: json["value"],
    );
}