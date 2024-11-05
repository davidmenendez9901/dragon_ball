class Character {
  Character({
    this.id,
    this.name,
    this.ki,
    this.maxKi,
    this.race,
    this.gender,
    this.description,
    this.image,
    this.affiliation,
    this.deletedAt,
    this.originPlanet,
    this.transformations,
  });

  final int? id;
  final String? name;
  final String? ki;
  final String? maxKi;
  final String? race;
  final String? gender;
  final String? description;
  final String? image;
  final String? affiliation;
  final String? deletedAt;
  final String? originPlanet;
  final List? transformations;

  Character fromMap(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      ki: json['ki'] as String,
      maxKi: json['maxKi'] as String,
      race: json['race'] as String,
      gender: json['gender'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      affiliation: json['affiliation'] as String,
      deletedAt:
          json['deletedAt'] == null ? 'Sin Datos' : json['deletedAt'] as String,
    );
  }
}
