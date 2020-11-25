import 'package:flutter/material.dart';
import 'package:yourhealth/data/consts/ambulance_list.dart';

class AmbulancePage extends StatelessWidget {
  final List<Map<String, dynamic>> _ambulanceList = ambulanceList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ambulance Services'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(_ambulanceList.length, (index) {
            List<dynamic> _list = _ambulanceList[index]['list'];
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _ambulanceList[index]['location'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(_list.length, (index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _list[index]['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(_list[index]['phone']),
                              Divider(),
                            ],
                          ),
                        );
                      })),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
