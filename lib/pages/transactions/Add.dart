import 'package:flutter/material.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/Nav/Recent.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/transactions/Manager.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Localdb? db;
  int amount = 0;
  final TextEditingController _addController = new TextEditingController();
  final TextEditingController _desController = new TextEditingController();
  void updateData() async {
    db = Localdb.getInstance;
    var data = await db!.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/HomePage');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: WhiteText(data: "Add Money to Wallet"),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            WhiteText(
              data: "Specify amount",
              size: 20,
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: _addController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "₹ amount",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _desController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Description",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                var money = int.parse(_addController.text);
                var tranType = "deposited";
                if (tranType.isNotEmpty && money != 0) {
                  bool check =
                      await db!.addData(amount: money, transaction: tranType);
                  if (check) {
                    updateData();
                  }
                }
                setState(() {
                  amount = int.parse(_addController.text);
                  Manager.addAmount(amount);
                });
              },
              child: WhiteText(data: "Add to Wallet"),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 61, 61, 61))),
            )
          ],
        ),
      ),
    );
  }
}
