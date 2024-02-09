import 'package:artisan/templates/controller_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({super.key});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {

  final controller = Get.put(ModuleController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<ModuleController>();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Modul Page"),
        ),
        body: Obx(() => Container(
          child: (controller.isLoading.value == true)?
          Center(
            child: Text("Loading data.."),
          ):(controller.theAvengers.isEmpty)?
          Center(
            child: Text("Empty data"),
          ):ListView.separated(
            itemBuilder: (_, index){
              return Text(controller.theAvengers[index]);
            }, 
            separatorBuilder: (_, index){
              return SizedBox(height: 10,);
            }, 
            itemCount: controller.theAvengers.length),
        )),
      ),
    );
  }
}