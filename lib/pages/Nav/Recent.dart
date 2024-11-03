import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';
import 'package:zzzwall/database/LocalDatabase.dart';

class RecentPage extends StatefulWidget {
  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
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
    return Container(
        child: Stack(
      children: [
        BlackGreyGradBackground(),
        Container(
          child: data.isNotEmpty
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          WhiteText(data: "${data[index][DbHelper.clmSNo]} "),
                      title: Text(
                        "₹ ${data[index][DbHelper.clmAmount]}",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 91, 211, 95)),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index][DbHelper.clm_transaction],
                            style: TextStyle(
                                color: const Color.fromARGB(255, 86, 116, 156)),
                          ),
                          Text(
                            data[index][DbHelper.clmDescription],
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 148, 160, 160)),
                          ),
                        ],
                      ),
                    );
                  })
              : Center(
                  child: WhiteText(data: "no recent transactions"),
                ),
        ),
      ],
    ));
  }
}
