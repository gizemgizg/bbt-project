import 'dart:convert';
import 'dart:developer';

import 'package:bbt_flutter_project/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  CharactersModel? charactersModel;

  @override
  void initState() {
    print("init state çalıştı");
    getCharacterData();
    super.initState();
  }

  Future<void> getCharacterData() async {
    final response =
        await http.get(Uri.parse("https://api.disneyapi.dev/character"));
    log(response.body);

    if (response.statusCode == 200) {
      charactersModel = CharactersModel.fromJson(json.decode(response.body));
      setState(() {});
    } else {
      print("hata var");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build çalıştı");
    return Scaffold(
        appBar: AppBar(
          title: const Text("BBT API Integration"),
        ),
        body: charactersModel?.data == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: charactersModel!.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(charactersModel!.data[index].name),
                  );
                }));
  }
}
