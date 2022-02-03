
class ClassModel {
  int? count;
  List? results;
  List? indexes;

  ClassModel({this.count, required this.results, this.indexes});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    var results = json['results'] as List;
    List resultsList = results.map((e) => 
      Results.fromJson(e).name).toList();
    
    return ClassModel(
      count: json['count'],
      results: resultsList,
      );
  }

}

class Results {
  String? index;
  String? name;
  String? url;

  Results({this.index, this.name, this.url});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
    index: json['index'],
    name:  json['name'],
    url: json['url'],
    );
  }
}

//----------------------------------------------------------------
/*
class SingleClass {
  String? index;
  String? name;
  int? hitDie;
  List<FromPC>? proficiencyChoices;
  List? proficiencies;
  List? savingThrows;
  List? startingEquipmentOptions;
  String? classLevels;
  List? subclasses;
  String? url;


  SingleClass(
      {this.index,
      this.name,
      this.hitDie,
      this.proficiencyChoices,
      this.proficiencies,
      this.savingThrows,
      this.startingEquipmentOptions,
      this.classLevels,
      this.subclasses,
      this.url});

  factory SingleClass.fromJson(Map<String, dynamic> json) {
    var index = json['index'];
    var name = json['name'];
    var hitDie = json['hit_die'];
    var proficiencyChoices = json['proficiency_choices'] as List;

      List proficiencyChoicesList = proficiencyChoices.map((e) => 
      ProficiencyChoices.fromJson(e).from).toList();
      print(proficiencyChoicesList);
      
      List<FromPC> pclToMap = proficiencyChoicesList.map((e) => 
      FromPC.fromJson(e)).toList();
      print(pclToMap);
    var url = json['url'];
    
    return SingleClass(
      index: index,
      name: name,
      hitDie: hitDie,
      url: url,
      proficiencyChoices: pclToMap,
    );
  }

}

//-----------------------------------------------

class ProficiencyChoices {
  int? choose;
  List? type;
  List? from;

  ProficiencyChoices({this.choose, this.type, this.from});

  factory ProficiencyChoices.fromJson(Map<String, dynamic> json) {
    var choose = json['choose'];
    var type = json['type'];
    var from = json['from'] as List;
    List<String?> proficiencyChoiceList = from.map((e) => FromPC.fromJson(e).name).toList();
      return ProficiencyChoices(
      choose: choose,
      type: type,
      from: proficiencyChoiceList,
      
    );
  }
}

class FromPC {
  String? index;
  String? name;
  String? url;

  FromPC({this.index, this.name, this.url});

  factory FromPC.fromJson(Map<String, dynamic> json) {
    return FromPC(
    index: json['index'],
    name: json['name'],
    url: json['url'],
    );
  }
}

//-----------------------------------------------------

class SavingThrows {
  String? index;
  String? name;
  String? url;

  SavingThrows({this.index, this.name, this.url});

  factory SavingThrows.fromJson(Map<String, String> json) {
    return SavingThrows(
      index: json['index'],
      name: json['name'],
      url: json['url'],
    );
  }
}
*/