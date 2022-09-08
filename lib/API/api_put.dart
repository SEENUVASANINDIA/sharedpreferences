// ignore_for_file: unused_field, prefer_final_fields, unnecessary_const

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(
    String category, String language, String genre, String sorting) async {
  final response = await http.post(
    Uri.parse('https://hoblist.com/api/movieList'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      //'title': title,

      "category": category,
      "language": language,
      "genre": genre,
      "sort": sorting,

//{
//       "category": "movies",
//      "language": "kannada",
//      "genre": "all",
//      "sort": "voting"
//
//}
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String sorting;
  final String category;

  final String language;

  final String genre;

  const Album({
    required this.category,
    required this.language,
    required this.genre,
    required this.sorting,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      category: json['category'],
      language: json['language'],
      genre: json['genre'],
      sorting: json['sorting'],
    );
  }
}

class MyAppPut extends StatefulWidget {
  const MyAppPut({super.key});

  @override
  State<MyAppPut> createState() {
    return _MyAppPutState();
  }
}

class _MyAppPutState extends State<MyAppPut> {
  // final TextEditingController _controller = TextEditingController();
  TextEditingController _categoryTextController = TextEditingController();

  TextEditingController _languageTextController = TextEditingController();

  TextEditingController _genreTextController = TextEditingController();

  TextEditingController _sortingTextController = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 35.0),
        TextField(
            controller: _categoryTextController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.abc,
                size: 20,
              ),
              hintText: 'Enter Category',
              contentPadding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              focusedBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
              ),
            )),
        const SizedBox(height: 35.0),
        TextField(
            controller: _languageTextController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.abc,
                size: 20,
              ),
              hintText: 'Enter Language',
              contentPadding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              focusedBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
              ),
            )),
        const SizedBox(height: 35.0),

        TextField(
            controller: _genreTextController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.abc,
                size: 20,
              ),
              hintText: 'Enter genere',
              contentPadding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              focusedBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
              ),
            )),
        const SizedBox(height: 35.0),

        TextField(
            controller: _sortingTextController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.abc,
                size: 20,
              ),
              hintText: 'Enter sorting method',
              contentPadding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              focusedBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
              ),
            )),
        const SizedBox(height: 35.0),

       
        const SizedBox(height: 20.0),

        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(
                _categoryTextController.text,
                _languageTextController.text,
                _genreTextController.text,
                _sortingTextController.text,
              );
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return (MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  children: const [
                    Text('API CALL SUCESS'),

                   
                  ],
                ),
              ),
            ),
          ));
          //Text(snapshot.data!.category);
        } else if (snapshot.hasData) {
          return Text('${snapshot.error}');
        }

        //return const CircularProgressIndicator();
        return const Text(
            'processing...'); // show untill the api porcess complete
      },
    );
  }
}
