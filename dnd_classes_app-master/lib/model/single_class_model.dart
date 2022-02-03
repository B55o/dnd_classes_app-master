class SingleClass {
  String? index;
  String? name;
  int? hitDie;
  List<ProficiencyChoices>? proficiencyChoices;
  List<Proficiencies>? proficiencies;
  List? savingThrows;
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
        proficiencies!.add(Proficiencies.fromJson(v));
      });
    }
    if (json['saving_throws'] != null) {
      savingThrows = [];
      json['saving_throws'].forEach((v) {
        savingThrows!.add(SingleClass.fromJson(v));
      });
    }
    if (json['starting_equipment'] != null) {
      startingEquipment = <StartingEquipment>[];
      json['starting_equipment'].forEach((v) {
        startingEquipment!.add(StartingEquipment.fromJson(v));
      });
    }
    if (json['starting_equipment_options'] != null) {
      startingEquipmentOptions = [];
      json['starting_equipment_options'].forEach((v) {
        startingEquipmentOptions!.add(SingleClass.fromJson(v));
      });
    }
    classLevels = json['class_levels'];
    multiClassing = json['multi_classing'] != null
        ? MultiClassing.fromJson(json['multi_classing'])
        : null;
    if (json['subclasses'] != null) {
      subclasses = [];
      json['subclasses'].forEach((v) {
        subclasses!.add(SingleClass.fromJson(v));
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

class Proficiencies {
  String? index;
  String? name;
  String? url;

  Proficiencies({this.index, this.name, this.url});
  
  factory Proficiencies.fromJson(Map<String, dynamic> json) {
    return Proficiencies(
    index: json['index'],
    name: json['name'],
    url: json['url'],
    );
  }
}

class From {
  String? index;
  String? name;
  String? url;

  From({this.index, this.name, this.url});

  From.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }
}

class StartingEquipment {
  From? equipment;
  int? quantity;

  StartingEquipment({this.equipment, this.quantity});

  StartingEquipment.fromJson(Map<String, dynamic> json) {
    equipment =
        json['equipment'] != null ? From.fromJson(json['equipment']) : null;
    quantity = json['quantity'];
  }
}

class From1 {
  From1? equipment;
  int? quantity;
  EquipmentOption? equipmentOption;

  From1({this.equipment, this.quantity, this.equipmentOption});

  From1.fromJson(Map<String, dynamic> json) {
    equipment =
        json['equipment'] != null ? From1.fromJson(json['equipment']) : null;
    quantity = json['quantity'];
    equipmentOption = json['equipment_option'] != null
        ? EquipmentOption.fromJson(json['equipment_option'])
        : null;
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