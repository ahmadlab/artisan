import 'package:flutter/material.dart';

class SinglePackage extends StatefulWidget {
  const SinglePackage({super.key});

  @override
  State<SinglePackage> createState() => _SinglePackageState();
}

class _SinglePackageState extends State<SinglePackage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Single Page"),
        ),
        body: Container(
          child: Text("Single Page"),
        ),
      ),
    );
  }
}