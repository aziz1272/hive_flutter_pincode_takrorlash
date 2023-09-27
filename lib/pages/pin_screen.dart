import 'package:flutter/material.dart';
import 'package:hive_flutter_pincode_takrorlash/local_db/local_db_control.dart';
import 'package:hive_flutter_pincode_takrorlash/pages/home_page.dart';

class PinScreen extends StatefulWidget {
  static const String id = "pin_screen";

  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController textEditingController = TextEditingController();
  LocalDb locale = LocalDb();

  int? pin;

  void getPinCode() async {
    locale.get(locale.key).then((value) {
      setState(() {
        pin = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPinCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pin kodni kiriting"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.number,
              smartDashesType: SmartDashesType.enabled,
            ),
            ElevatedButton(
              onPressed: () {
                if(pin==null){
                  if(textEditingController.text.trim()=="123456"){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  }else{
                    // showdialog
                  }
                }else{
                  if(textEditingController.text.trim()==pin.toString()){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  } else{
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                "kirish",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
