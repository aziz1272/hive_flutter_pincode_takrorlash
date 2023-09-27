import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter_pincode_takrorlash/local_db/local_db_control.dart';
import 'package:hive_flutter_pincode_takrorlash/pages/home_page.dart';
import 'package:hive_flutter_pincode_takrorlash/local_db/pinkod_page.dart';
import 'package:hive_flutter_pincode_takrorlash/pages/pin_screen.dart';

void main() async{
  LocalDb local = LocalDb();
  await Hive.initFlutter();
  await Hive.openBox(local.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PinScreen(),
      routes: {
        PinScreen.id:(context) => const PinScreen(),
        PinkodPage.id:(context)=> const PinkodPage(),
        HomePage.id:(context)=> const HomePage(),
      },
    );
  }
}
