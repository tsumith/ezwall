import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DbHelper? mydb;
  List<Map<String, dynamic>> data = [];
  List<int> amounts = [];
  List<String> _dates = [];
  List<int> convertedDates = [];
  double screenwidth = 200;
  @override
  void initState() {
    super.initState();
    mydb = DbHelper.getInstance;
    update();
  }

  double spent = 0;
  double deposit = 0;
  double totalAmount = 0;

  void update() async {
    data = await mydb!.getData();
    _dates = await mydb!.getDateTime();

    for (int i = 0; i < _dates.length; i++) {
      int amount = data[i][DbHelper.clmAmount];
      amounts.add(amount);
      String date = data[i][DbHelper.clmDateTime];
      DateTime parsedData = DateFormat('dd-MM-yyyy').parse(date);
      int milsec = parsedData.day;
      convertedDates.add(milsec);
    }
    screenwidth = 120 * (_dates.length.toDouble());
    setState(() {});

    int temp1;
    temp1 = await mydb!.getTotalSpent();
    spent = temp1.toDouble();
    int temp2;
    temp2 = await mydb!.getTotalDeposit();
    deposit = temp2.toDouble();
    int temp3;
    temp3 = await mydb!.gettotalAmount();
    totalAmount = temp3.toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          BlackGreyGradBackground(),
          ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(20),
                          height: 500,
                          width: screenwidth,
                          child: BarChart(BarChartData(
                              titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  int index = value.toInt();
                                  if (index >= 0 &&
                                      index < convertedDates.length) {
                                    return Text(
                                        '${_dates[index].substring(0, 10)}');
                                  } else {
                                    return Text("no");
                                  }
                                },
                              ))),
                              barGroups: List.generate(_dates.length, (index) {
                                return BarChartGroupData(x: index, barRods: [
                                  BarChartRodData(
                                      toY: amounts[index].toDouble(), width: 20)
                                ]);
                              }))))),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: Stack(children: [
                      Center(
                        child: Container(
                          // ignore: sort_child_properties_last
                          child: Center(
                            child: Text(
                              "current\nTotal:\n$totalAmount",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 115, 185, 243),
                              borderRadius: BorderRadius.circular(55)),
                          height: 140,
                          width: 140,
                        ),
                      ),
                      PieChart(PieChartData(centerSpaceRadius: 90, sections: [
                        PieChartSectionData(
                          titleStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          radius: 60,
                          value: spent,
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            const Color.fromARGB(255, 136, 29, 22)
                          ]),
                        ),
                        PieChartSectionData(
                            radius: 60,
                            titleStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            value: deposit,
                            gradient: LinearGradient(colors: [
                              Colors.green,
                              const Color.fromARGB(255, 34, 116, 36)
                            ]))
                      ])),
                    ]),
                  ),
                ],
              ),
            ),
          ])
        ],
      )),
    );
  }
}
