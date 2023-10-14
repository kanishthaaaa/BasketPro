import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nba/team.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Team> teams = [];

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
    print(teams.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TEAMS',
          style: GoogleFonts.poppins(),
        ),
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            //done loading
            //showing team data
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(teams[index].abbreviation),
                          subtitle: Text(teams[index].city),
                        ),
                      ),
                    );
                  });
              //if its still loading
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
