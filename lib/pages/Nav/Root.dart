import 'package:flutter/material.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/components/Button1.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';
import 'package:zzzwall/pages/components/Walletcard.dart';

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  DbHelper? db;
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    db = DbHelper.getInstance;
    fetchData();
  }

  void fetchData() async {
    data = await db!.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sidePadding = 15;
    return Container(
      child: Stack(children: [
        BlackGreyGradBackground(),
        ListView(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(sidePadding),
              child: WhiteText(
                size: 20,
                data: "Your Wallet",
              ),
            ),
            Walletcard(
              screenWidth: screenWidth,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button1(
                  onpressed: () {
                    Navigator.pushNamed(context, 'AddPage').then((value) {
                      fetchData();
                    });
                  },
                  text: "Add",
                  color: const Color.fromARGB(255, 11, 65, 109),
                ),
                SizedBox(
                  width: 15,
                ),
                Button1(
                  onpressed: () {
                    Navigator.pushNamed(context, 'SpendPage').then((value) {
                      fetchData();
                    });
                  },
                  text: "Spend",
                  color: const Color.fromARGB(255, 27, 119, 5),
                ),
                SizedBox(
                  width: 15,
                ),
                Button1(
                  onpressed: () {},
                  text: "Transfer",
                  shadowcolor: Colors.white,
                  color: const Color.fromARGB(255, 196, 85, 51),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            WhiteText(data: "  recent activities"),
            SizedBox(
              height: 20,
            ),
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 10, 75, 133),
                      const Color.fromARGB(255, 13, 70, 119),
                      Colors.blue
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                height: 308,
              ),
              Column(
                children: [
                  Container(
                    child: Center(child: WhiteText(data: "Transactions")),
                    height: 50,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 116, 112, 112),
                                spreadRadius: 2,
                                blurRadius: 7)
                          ],
                          borderRadius: BorderRadius.circular(19),
                          color: const Color.fromARGB(255, 240, 233, 228)),
                      height: 250,
                      child: data.isEmpty
                          ? Center(child: Text("no transations"))
                          : ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text(
                                    "${data[index][DbHelper.clmSNo]}",
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹ ${data[index][DbHelper.clmAmount]}",
                                        style: TextStyle(
                                            color: data[index][DbHelper
                                                        .clm_transaction] ==
                                                    "Deposit"
                                                ? Color.fromARGB(
                                                    255, 9, 184, 15)
                                                : Colors.red),
                                      ),
                                      Text(
                                        "${data[index][DbHelper.clmDateTime]}",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index][DbHelper.clm_transaction],
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 94, 92, 92)),
                                      ),
                                      Text(
                                        data[index][DbHelper.clmDescription],
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 74, 155, 155)),
                                      )
                                    ],
                                  ),
                                );
                              })),
                ],
              )
            ])
          ],
        ),
      ]),
    );
  }
}

// ignore: must_be_immutable
class WhiteText extends StatelessWidget {
  String data;
  double? size;
  WhiteText({required this.data, this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}
