import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:networking/data_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataservice = HttpService();
  String? _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Service"),
        ),
        body: Center(
          child: Builder(builder: (_) {
            if (_response != null) {
              return Text(_response!);
            } else {
              return ElevatedButton(onPressed: getUser, child: Text("Reload"));
            }
          }),
        ),
      ),
    );
  }

  getUser() async {
    final res = await _dataservice.getData();
    setState(() {
      _response = res;
    });
  }
}
