import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/country.dart';
import 'package:yourhealth/data/services/api_services.dart';
import 'package:yourhealth/view/pages/patient_story/country_stat.dart';

class CovidLocalStat extends StatefulWidget {
  @override
  _CovidLocalStatState createState() => _CovidLocalStatState();
}

class _CovidLocalStatState extends State<CovidLocalStat> {
  List<Color> _colorList = [
    Colors.blue,
    Colors.orange[700],
    Colors.red,
    Colors.green,
  ];
  ScrollController _scrollController;
  List<Country> _countryList = List<Country>();
  bool _isDataLoaded = false;

  @override
  void initState() {
    _getData();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: Icon(Icons.arrow_upward),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covid Local Stat'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: !_isDataLoaded
                ? [Center(child: CircularProgressIndicator())]
                : _countryList
                    .map((e) => Card(
                          elevation: 5,
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: ListTile(
                              leading: Tab(
                                icon: Image.network(
                                  e.image,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              title: Text(e.name),
                              onTap: () {
                                Country country = e;
                                Map<String, double> data = {
                                  'Cases': country.cases.toDouble(),
                                  'Active': country.active.toDouble(),
                                  'Deaths': country.deaths.toDouble(),
                                  'Recovered': country.recovered.toDouble()
                                };
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryStatScreen(
                                            dataMap: data,
                                            name: country.name,
                                            colorList: _colorList)));
                              }),
                        ))
                    .toList(),
          ),
        ),
      ),
    );
  }

  Future<void> _getData() async {
    //_covidData = await ApiService.getGlobalStat();
    _countryList = await ApiService.getCountryStat();
    Country temp = _countryList[0];
    int index =
        _countryList.indexWhere((element) => element.name == 'Bangladesh');
    _countryList[0] = _countryList[index];
    _countryList[index] = temp;

    // _countryList.forEach((e) {
    //   print(
    //       '${e.name}:  ${e.critical} ${e.deaths} ${e.recovered} ${e.active} ${e.image}');
    // });
    setState(() {
      _isDataLoaded = true;
    });
  }
}
