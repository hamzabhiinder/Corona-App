
import 'package:corona_appfull/Views/WorldState.dart';
import 'package:flutter/material.dart';

class DetailCountry extends StatefulWidget {
  final String image;
  final String name;
  final int totalcase;
  final int totalDeath;
  final int totalRecoverd;
  final int totalActive;
  final int critical;
  final int todayRecovered;
  final int test;
  const DetailCountry(
      {Key? key,
      required this.image,
      required this.name,
      required this.totalcase,
      required this.totalDeath,
      required this.totalRecoverd,
      required this.totalActive,
      required this.critical,
      required this.todayRecovered,
      required this.test})
      : super(key: key);

  @override
  State<DetailCountry> createState() => _DetailCountryState();
}

class _DetailCountryState extends State<DetailCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Titles(
                          title: 'Cases', value: widget.totalcase.toString()),
                      Titles(
                          title: 'Today Recovered',
                          value: widget.todayRecovered.toString()),
                      Titles(
                          title: 'Death', value: widget.totalDeath.toString()),
                      Titles(
                          title: 'Critical', value: widget.critical.toString()),
                      Titles(title: 'Test', value: widget.test.toString()),
                      Titles(
                          title: 'Active',
                          value: widget.totalActive.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          ),
        ],
      ),
    );
  }
}
