import 'package:corona_appfull/Model/worldStateApi.dart';
import 'package:corona_appfull/Services/ModelState.dart';
import 'package:corona_appfull/Views/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldState extends StatefulWidget {
  const WorldState({Key? key}) : super(key: key);

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(vsync: this)
  //   ..repeat();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _controller.dispose();
  // }

  final colorList = <Color>[
    const Color(0xff4205F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StateService stateServices = StateService();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              FutureBuilder(
                future: stateServices.getWorldRecord(),
                builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": 95,
                            // double.parse(snapshot.data!.cases.toString()),
                            "Recovered": 18,
                            // double.parse(
                            //     snapshot.data!.recovered.toString()),
                            'Death': 89
                            // double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: const Duration(seconds: 2),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          chartType: ChartType.ring,
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                          colorList: colorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            child: Column(
                              children: [
                                Titles(
                                    title: "Total",
                                    value: "snapshot.data!.cases.toString()"),
                                Titles(
                                    title: "Recovered",
                                    value:
                                        "snapshot.data!.recovered.toString()"),
                                Titles(
                                    title: "Death",
                                    value: " snapshot.data!.deaths.toString()"),
                                Titles(
                                    title: "Active",
                                    value: " snapshot.data!.active.toString()"),
                                Titles(
                                    title: "Critical",
                                    value:
                                        "snapshot.data!.critical.toString()"),
                                Titles(
                                    title: "Today Death",
                                    value:
                                        "snapshot.data!.todayDeaths.toString()"),
                                Titles(
                                    title: "Today Recoverd",
                                    value:
                                        " snapshot.data!.todayRecovered.toString()"),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryScreenList()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text('Track Country'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class Titles extends StatelessWidget {
  final String title;
  final String value;
  const Titles({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

class ReusableRow extends StatefulWidget {
  final String title;
  final String value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  State<ReusableRow> createState() => _ReusableRowState();
}

class _ReusableRowState extends State<ReusableRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(widget.title), Text(widget.value)],
      ),
    );
  }
}
