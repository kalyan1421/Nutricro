// import 'package:flutter/material.dart';

// class Fav_fruits extends StatefulWidget {
//   const Fav_fruits({super.key});

//   @override
//   State<Fav_fruits> createState() => _Fav_fruitsState();
// }

// class _Fav_fruitsState extends State<Fav_fruits> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("Favorites Fruits")),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class NutriScoreData {
//   final List<Map<String, dynamic>> data;

//   NutriScoreData({required this.data});
// }

// class NutriScoreService {
//   // final String apiUrl = 'http://fruitmap.org/api/trees';
//   final String apiUrl =
//       "https://fwallet.net/fruits?requestType=getAccount&account=11893374300192068297";

//   Future<NutriScoreData> getNutriScore() async {
//     final response = await http.get(
//       Uri.parse(apiUrl),
//       headers: {
//         'X-RapidAPI-Key': '70a1937170mshf09c7c3dbb2e6bdp1f493cjsned354eec4e4a',
//         'X-RapidAPI-Host': 'nutri-score.p.rapidapi.com',
//       },
//     );
//     if (response.statusCode == 200) {
//       final List<dynamic> dataList = json.decode(response.body);
//       final List<Map<String, dynamic>> data =
//           dataList.cast<Map<String, dynamic>>();
//       return NutriScoreData(data: data);
//     } else {
//       throw Exception('Failed to load Nutri-Score data');
//     }
//   }
// }

// class NutriScoreDisplay extends StatefulWidget {
//   @override
//   _NutriScoreDisplayState createState() => _NutriScoreDisplayState();
// }

// class _NutriScoreDisplayState extends State<NutriScoreDisplay> {
//   late Future<NutriScoreData> _nutriScoreData;

//   @override
//   void initState() {
//     super.initState();
//     _nutriScoreData = NutriScoreService().getNutriScore();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nutri-Score Display App'),
//       ),
//       body: FutureBuilder<NutriScoreData>(
//         future: _nutriScoreData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Errorccc: ${snapshot.error}'));
//           } else {
//             return Center(
//                 child: Text('Nutri-Score Data: ${snapshot.data!.data}'));
//           }
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EdamamApiExample extends StatefulWidget {
  @override
  _EdamamApiExampleState createState() => _EdamamApiExampleState();
}

class _EdamamApiExampleState extends State<EdamamApiExample> {
  Future<Map<String, dynamic>> fetchData() async {
    const String apiUrl =
        'https://edamam-food-and-grocery-database.p.rapidapi.com/api/food-database/v2/parser';
    const Map<String, String> headers = {
      'X-RapidAPI-Key': '70a1937170mshf09c7c3dbb2e6bdp1f493cjsned354eec4e4a',
      'X-RapidAPI-Host': 'edamam-food-and-grocery-database.p.rapidapi.com',
    };
    final Map<String, String> queryParams = {
      'nutrition-type': 'cooking',
      'category[0]': 'generic-foods',
      'health[0]': 'alcohol-free',
    };

    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load data from Edamam API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edamam API Example'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Display the fetched data in your UI as needed
            return Center(child: Text('Response Data: ${snapshot.data}'));
          }
        },
      ),
    );
  }
}
