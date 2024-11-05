import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DbHelper? mydb;
  List<Map<String, dynamic>> data = [];
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
    return Container(
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
                Container(
                    color: Colors.white,
                    width: 300,
                    height: 300,
                    child: LineChart(LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            isCurved: true,
                            spots: [FlSpot(1, 1), FlSpot(2, 3), FlSpot(5, 5)]),
                      ],
                    ))),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 300,
                  width: 300,
                  child: Stack(children: [
                    Center(
                      child: Container(
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
    ));
  }
}
