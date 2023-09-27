import 'package:flutter/material.dart';
import 'package:hive_flutter_pincode_takrorlash/local_db/local_db_control.dart';
import 'package:hive_flutter_pincode_takrorlash/pages/home_page.dart';

class PinkodPage extends StatefulWidget {
  static const String id = "pinkod_page";

  const PinkodPage({super.key});

  @override
  State<PinkodPage> createState() => _PinkodPageState();
}

class _PinkodPageState extends State<PinkodPage> {
  TextEditingController pinController = TextEditingController();

  int pincode=0;
  LocalDb local = LocalDb();

void getFromLocale() async {
final pinkods = await local.get("pinkods");
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFromLocale();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kodni kiriting"),
        centerTitle: true,
      ),
      body: Center(
        child: TextField(
          controller: pinController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: "kodni kiriting", icon: Icon(Icons.password_rounded)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                pincode = int.parse(pinController.text.trim());
              });
              local.add(pincode, "pinkods");
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: const Text("yangilash"),
          ),
        ],
      ),
    );
  }
}
