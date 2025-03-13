class Userinfobody {
  final String? name;
  final String? job;
  const Userinfobody({this.name, this.job});
  Userinfobody copyWith({String? name, String? job}) {
    return Userinfobody(name: name ?? this.name, job: job ?? this.job);
  }

  Map<String, Object?> toJson() {
    return {'name': name, 'job': job};
  }

  static Userinfobody fromJson(Map<String, Object?> json) {
    return Userinfobody(
        name: json['name'] == null ? null : json['name'] as String,
        job: json['job'] == null ? null : json['job'] as String);
  }

  @override
  String toString() {
    return '''Userinfobody(
                name:$name,
job:$job
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Userinfobody &&
        other.runtimeType == runtimeType &&
        other.name == name &&
        other.job == job;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, job);
  }
}
