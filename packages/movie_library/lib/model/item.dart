class Item {
  final int id;
  final String? title;
  final String? imageUrl;
  final String? type;
  final String? description;

  Item({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.type,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    String concatenatedOverviews = '';
    if (json['media_type'] == "person") {
      concatenatedOverviews = (json['known_for'] as List)
          .map((item) => item['overview'] as String)
          .where((overview) => overview.isNotEmpty)
          .join(' ');
    }

    return Item(
      id: json['id'],
      title: json['media_type'] == "person"
          ? json['original_name']
          : (json['media_type'] == "tv" ? json['name'] : json['title']),
      imageUrl: json['media_type'] == "person"
          ? json['profile_path']
          : json['poster_path'],
      type: json['media_type'],
      description: json['media_type'] == "person"
          ? concatenatedOverviews
          : json['overview'],
    );
  }
}
