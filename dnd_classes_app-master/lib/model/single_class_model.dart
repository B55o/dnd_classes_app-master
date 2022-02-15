class SingleClass {
  String? index;
  String? name;
  int? hitDie;
  List<ProficiencyChoices>? proficiencyChoices;
  List<From>? proficiencies;
  List<From>? savingThrows;
  List<StartingEquipment>? startingEquipment;
  List? startingEquipmentOptions;
  String? classLevels;
  MultiClassing? multiClassing;
  List? subclasses;
  String? url;

  SingleClass(
      {this.index,
      this.name,
      this.hitDie,
      this.proficiencyChoices,
      this.proficiencies,
      this.savingThrows,
      this.startingEquipment,
      this.startingEquipmentOptions,
      this.classLevels,
      this.multiClassing,
      this.subclasses,
      this.url});

  SingleClass.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    hitDie = json['hit_die'];
    if (json['proficiency_choices'] != null) {
      proficiencyChoices = [];
      json['proficiency_choices'].forEach((v) {
        proficiencyChoices!.add(ProficiencyChoices.fromJson(v));
      });
    }
    if (json['proficiencies'] != null) {
      proficiencies = [];
      json['proficiencies'].forEach((v) {
        proficiencies!.add(From.fromJson(v));
      });
    }
    if (json['saving_throws'] != null) {
      savingThrows = [];
      json['saving_throws'].forEach((v) {
        savingThrows!.add(From.fromJson(v));
      });
    }
    if (subclasses != null) {
      json['subclasses'] = subclasses!.map((v) => v.toJson()).toList();
    }
    if (json['starting_equipment'] != null) {
      startingEquipment = <StartingEquipment>[];
      json['starting_equipment'].forEach((v) {
        startingEquipment!.add(StartingEquipment.fromJson(v));
      });
    } 
    url = json['url'];
  }
}

class ProficiencyChoices {
  int? choose;
  String? type;
  List<From>? from;

  ProficiencyChoices({this.choose, this.type, this.from});

  ProficiencyChoices.fromJson(Map<String, dynamic> json) {
    choose = json['choose'];
    type = json['type'];
    if (json['from'] != null) {
      from = <From>[];
      json['from'].forEach((v) {
        from!.add(From.fromJson(v));
      });
    }
  }
}

class From {
  String? index;
  String? name;
  String? url;

  From({this.index, this.name, this.url});
  
  factory From.fromJson(Map<String, dynamic> json) {
    return From(
    index: json['index'],
    name: json['name'],
    url: json['url'],
    );
  }
}


class StartingEquipment {
  From? equipment;
  int? quantity;

  StartingEquipment({this.equipment, this.quantity});

  StartingEquipment.fromJson(Map<String, dynamic> json) {
    equipment = json['equipment'] != null 
      ? From.fromJson(json['equipment']) : null;
    quantity = json['quantity'];
  }
}


class EquipmentOption {
  int? choose;
  String? type;
  From? from;

  EquipmentOption({this.choose, this.type, this.from});

  EquipmentOption.fromJson(Map<String, dynamic> json) {
    choose = json['choose'];
    type = json['type'];
    from = json['from'] != null ? From.fromJson(json['from']) : null;
  }
}

class FromEquipmentInfo {
  var equipmentCategory;

  FromEquipmentInfo({this.equipmentCategory});

  FromEquipmentInfo.fromJson(Map<String, dynamic> json) {
    equipmentCategory = json['equipment_category'] != null
        ? FromEquipmentInfo.fromJson(json['equipment_category'])
        : null;
  }
}

class MultiClassing {
  List<Prerequisites>? prerequisites;
  List proficiencies = [];

  MultiClassing({this.prerequisites, required this.proficiencies});

  MultiClassing.fromJson(Map<String, dynamic> json) {
    if (json['prerequisites'] != null) {
      prerequisites = <Prerequisites>[];
      json['prerequisites'].forEach((v) {
        prerequisites!.add(Prerequisites.fromJson(v));
      });
    }
    if (json['proficiencies'] != null) {
      proficiencies = [];
      json['proficiencies'].forEach((v) {
        proficiencies.add(MultiClassing.fromJson(v));
      });
    }
  }
}

class Prerequisites {
  From? abilityScore;
  int? minimumScore;

  Prerequisites({this.abilityScore, this.minimumScore});

  Prerequisites.fromJson(Map<String, dynamic> json) {
    abilityScore = json['ability_score'] != null
        ? From.fromJson(json['ability_score'])
        : null;
    minimumScore = json['minimum_score'];
  }
}