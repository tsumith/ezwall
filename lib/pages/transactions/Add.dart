import 'package:flutter/material.dart';
import 'package:zzzwall/database/LocalDatabase.dart';
import 'package:zzzwall/pages/Nav/Root.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _addController = TextEditingController();
  TextEditingController _desController = TextEditingController();
  DbHelper? mydb;
  @override
  void initState() {
    super.initState();
    mydb = DbHelper.getInstance;
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
                bool check = await mydb!.addData(
                    amount: int.parse(_addController.text),
                    description: _desController.text,
                    transacn: "Deposit");
                if (check) {
                  setState(() {});
                  Navigator.pop(context, 'Updated data');
                }
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
