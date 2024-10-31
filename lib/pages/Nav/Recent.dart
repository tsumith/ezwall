import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';
import 'package:zzzwall/database/LocalDatabase.dart';

class RecentPage extends StatefulWidget {
  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  List<Map<String, dynamic>> data = [];
  Localdb? db;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    db = Localdb.getInstance;
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
                      leading: Text("${data[index][Localdb.clmSNo]}"),
                      title: Text("${data[index][Localdb.clmAmount]}"),
                      subtitle: Text(data[index][Localdb.clmTransaction]),
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
