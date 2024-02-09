library artisan;

import 'dart:io';

import 'package:artisan/utilities.dart';
import 'package:yaml/yaml.dart';

/// A Calculator.
void artisanGenerator(List<String>? arguments) {
  if (arguments!.isEmpty) {
    return Utilities().printError(
        "please complete instruction with some arguments, for help please type 'dart run arisan --help'");
  }
  String instruction = "";
  String instructionValue = "";
  String instructionDetail = "";
  bool isDetected = false;
  List<String> validInstruction = ['make', 'list'];
  List<String> validInstructionValue = [
    'controller',
    'page',
    'repository',
    'module'
  ];
  arguments.asMap().entries.map((e) {
    /* 
    get first arguments
    get 0 argument from first argument
    get scound argument
    0 argument candidate
    make:
    list:
    */
    if (e.value == "--help") {
      instruction = 'help';
      isDetected = true;
    } else {
      if(e.key == 0){
        isDetected = true;
        List<String> listArgs = e.value.split(":");
        if(validInstruction.indexWhere((element) => element == listArgs[0]) == -1){
          return invalidArguments();
        }
        if(validInstructionValue.indexWhere((element) => element == listArgs[1]) == -1){
          return invalidArguments();
        }
        instruction = listArgs[0];
        instructionValue = listArgs[1];
      }else if(e.key == 1){
        instructionDetail = e.value;
      }else{
        isDetected = false;
      }
    }

  }).toList();
  if (instruction == 'help') {
    return helpGenerator();
  }
  if(instruction == "make"  && instructionDetail == ""){
    return invalidArguments();
  }
  if (isDetected == false) {
    return Utilities().printError(
        "please complete instruction with some arguments, for help please type 'dart run arisan --help'");
  }
  if(instruction == "make"){
    if(instructionValue == "controller"){
      generateSingleController(instructionDetail);
    } else if(instructionValue == 'page'){
      genereteSinglePage(instructionDetail);
    }else if(instructionValue == 'repository'){
      generateSingleRepository(instructionDetail);
    }else if(instructionValue == "module"){
      generateModule(instructionDetail);
    }
  }else if(instruction == 'list'){
     if(instructionValue == "controller"){
      generateListController();
    } else if(instructionValue == 'repository'){
      generateListRepository();
    }
  }
  
}

String getPackageName() {
  String yamlString = File('pubspec.yaml').readAsStringSync();
  // Parsing isi file YAML
  var doc = loadYaml(yamlString);
  // Mendapatkan nilai parameter "name"
  var name = doc['name'];
  return name;
}

void helpGenerator() {
  Utilities().printWarning(
      "type 'dart run artisan make:controller name-of-controller' to create getX controller");
  Utilities().printWarning(
      "type 'dart run artisan make:page name-of-page' to create page widget");
  Utilities().printWarning(
      "type 'dart run artisan make:repository name-of-repository' to create repository");
  Utilities().printWarning(
      "type 'dart run artisan make:module name-of-module' to create full module file, including page, controller and repository");
  Utilities().printWarning(
      "type 'dart run artisan list:controller' to see all controller list in ./pub/controllers folder");
  Utilities().printWarning(
      "type 'dart run artisan list:repository' to see all repository list in ./pub/repositories folder");
}

void invalidArguments(){
  return Utilities().printError(
        "Invalid argument, for help please type 'dart run arisan --help'");
}

void generateSingleController(String path){
  Utilities().printSuccess("Generate $path Controller");
}

void genereteSinglePage(String path){
  Utilities().printSuccess("Generate $path Page");

}

void generateSingleRepository(String path){
  Utilities().printSuccess("Generate $path Repository");

} 

void generateModule(String path){
  Utilities().printSuccess("Generate $path Module");

}
void generateListController(){
  String directoryPath = './lib/controllers/';
  Directory directory = Directory(directoryPath);
  List<FileSystemEntity> fileList = directory.listSync();
  if (fileList.isNotEmpty) {
    Utilities().printSuccess("Respositories List $directoryPath");
    for (var entity in fileList) {
      if (entity is File) {
        Utilities().printSuccess(entity.path);
      }
    }
  } else {
    Utilities().printSuccess('Direktory $directoryPath is empty.');
  }

}
void generateListRepository(){
  
  String directoryPath = './lib/repositories/';
  Directory directory = Directory(directoryPath);
  List<FileSystemEntity> fileList = directory.listSync();
  if (fileList.isNotEmpty) {
    Utilities().printSuccess("Respositories List $directoryPath");
    for (var entity in fileList) {
      if (entity is File) {
        Utilities().printSuccess(entity.path);
      }
    }
  } else {
    Utilities().printSuccess('Direktory $directoryPath is empty.');
  }

}