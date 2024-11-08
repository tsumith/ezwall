import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/Walletcard.dart';

class SendPage extends StatefulWidget {
  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  var currentTime = "";
  DbHelper? db;
  int amount = 0;
  TextEditingController _sendController = TextEditingController();
  TextEditingController _desController = TextEditingController();
  @override
  void initState() {
    super.initState();
    db = DbHelper.getInstance;
    _updateTime();
  }

  void _updateTime() {
    var now = DateTime.now();
    var formatter = DateFormat("dd-MM-yyyy hh:mm");
    currentTime = formatter.format(now);
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
        title: WhiteText(data: "Debit money from Wallet"),
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
              controller: _sendController,
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
              style: TextStyle(color: Colors.white),
              controller: _desController,
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
                _updateTime();
                bool check = await db!.addData(
                    amount: int.parse(_sendController.text),
                    description: _desController.text,
                    transacn: "Spend",
                    datime: currentTime);
                if (check) {
                  setState(() {});
                  Walletcard.walletcardKey.currentState?.giveAmount();
                  Navigator.pop(context, "popped");
                }
              },
              child: WhiteText(data: "send from wallet"),
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
