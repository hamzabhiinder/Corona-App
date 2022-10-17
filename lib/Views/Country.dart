import 'package:corona_appfull/Services/ModelState.dart';
import 'package:corona_appfull/Views/detailScreen.dart';
import 'package:flutter/material.dart';

class CountryScreenList extends StatefulWidget {
  const CountryScreenList({Key? key}) : super(key: key);

  @override
  State<CountryScreenList> createState() => _CountryScreenListState();
}

class _CountryScreenListState extends State<CountryScreenList> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateService stateServices = StateService();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Countries"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search with Country name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.getCountriesRecord(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String name =
                            snapshot.data![index]['country'].toString();

                        if (controller.text.isEmpty) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailCountry(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      name: snapshot.data![index]['country'],
                                      totalcase: snapshot.data![index]['cases'],
                                      totalDeath: snapshot.data![index]
                                          ['deaths'],
                                      totalRecoverd: snapshot.data![index]
                                          ['recovered'],
                                      totalActive: snapshot.data![index]
                                          ['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      test: snapshot.data![index]['tests']),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                snapshot.data![index]['cases'].toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              leading: Image(
                                  height: 50,
                                  width: 45,
                                  image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag'])),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(controller.text.toLowerCase())) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailCountry(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      name: snapshot.data![index]['country'],
                                      totalcase: snapshot.data![index]['cases'],
                                      totalDeath: snapshot.data![index]
                                          ['deaths'],
                                      totalRecoverd: snapshot.data![index]
                                          ['recovered'],
                                      totalActive: snapshot.data![index]
                                          ['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      test: snapshot.data![index]['tests']),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                snapshot.data![index]['cases'].toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              leading: Image(
                                  height: 50,
                                  width: 45,
                                  image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag'])),
                            ),
                          );
                        } else {
                          return Container();
                        }
                        return ListTile(
                          title: Text(snapshot.data![index]['country']),
                          subtitle: Text(
                            snapshot.data![index]['cases'].toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          leading: Image(
                              height: 50,
                              width: 45,
                              image: NetworkImage(snapshot.data![index]
                                  ['countryInfo']['flag'])),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
