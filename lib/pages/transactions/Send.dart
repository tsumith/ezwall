import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/transactions/Manager.dart';

class SendPage extends StatefulWidget {
  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  int amount = 0;
  TextEditingController sendController = new TextEditingController();

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
              controller: sendController,
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
              keyboardType: TextInputType.number,
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
              onPressed: () {
                setState(() {
                  amount = int.parse(sendController.text);
                  Manager.spendAmount(amount);
                });
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
