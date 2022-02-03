import 'package:dnd_classes_app/model/data_model.dart';
import 'package:dnd_classes_app/model/single_class_model.dart';
import 'package:dnd_classes_app/model/skill_desc_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataServices {

  final _url = "https://www.dnd5eapi.co/api/classes/";
  
  Future getInfo () async {
    http.Response _res = await http.get(Uri.parse(_url));
    try {
      if (_res.statusCode == 200) {
        Map<String, dynamic> _jsonResp = json.decode(_res.body);
        var tempResults = ClassModel.fromJson(_jsonResp).results;
        
        return tempResults;
      }else {
      return <ClassModel>[];
      }
    }catch(e) {
      return <ClassModel>[];
    }
  }

  Future getClassInf (classData) async {
    try {
      List generalClassInfo = [];
      http.Response _res = await http.get(Uri.parse(_url+classData));
      if (_res.statusCode == 200) {
        Map<String, dynamic> _jsonResp = json.decode(_res.body);
        var tempClassInf = SingleClass.fromJson(_jsonResp).proficiencyChoices![0].from;
        for (int i=0; i < tempClassInf!.length; i++) {
          generalClassInfo.add(tempClassInf[i].name!.substring(7));
        }
          return generalClassInfo;
      }
    }catch(e) {
      print(e);
      //return Container();
    }
  }

    Future getClassInfo (classData, checkedData) async {
    try {
      List<String?> generalClassInfo = [];
      http.Response _res = await http.get(Uri.parse(_url+classData));
        if (_res.statusCode == 200) {
        Map<String, dynamic> _jsonResp = json.decode(_res.body);
        if (checkedData == 'proficiencies'){
          var tempClassInfo = SingleClass.fromJson(_jsonResp).proficiencies;
          for (int i=0; i < tempClassInfo!.length; i++) {
          generalClassInfo.add(tempClassInfo[i].name);
        }
        return generalClassInfo;
      } else if (checkedData == 'proficiency_choices') {
        var tempClassInf = SingleClass.fromJson(_jsonResp).proficiencyChoices![0].from;
        for (int i=0; i < tempClassInf!.length; i++) {
          generalClassInfo.add(tempClassInf[i].name!.substring(7));
        }
        return generalClassInfo;
      }
        }
      }
catch(e) {
      print(e);
      //return Container();
    }
  }

  Future getSkillInfo(skillData) async {

    http.Response _res = await http.get(Uri.parse(_url+skillData));
    try {
    if (_res.statusCode == 200) {
      Map<String, dynamic> _jsonResp = json.decode(_res.body);
      var skillInfo = SkillDescModel.fromJson(_jsonResp).name.toString();
      return skillInfo;
    }
  }catch(e){
    print(e);
  }
  }
}