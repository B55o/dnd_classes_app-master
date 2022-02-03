class SkillDescModel {
  String? index;
  String? name;
  List<String>? desc;
  List<AbilityScore?>? abilityScore;
  String? url;

  SkillDescModel(
      {this.index, this.name, this.desc, this.abilityScore, this.url});

    factory SkillDescModel.fromJson(Map<String, dynamic> json) {
      var abilityScore = json['ability_score'] as List;
      List<AbilityScore> abScore = abilityScore.map((e) =>
      AbilityScore.fromJson(e).name) as List<AbilityScore>;

    return SkillDescModel(
      index: json['index'],
      name: json['name'],
      desc: json['desc'].cast<String>(),
      url: json['url'],
      abilityScore: abScore
    );
  }
}

class AbilityScore {
  String? index;
  String? name;
  String? url;

  AbilityScore({this.index, this.name, this.url});

  AbilityScore.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }
}