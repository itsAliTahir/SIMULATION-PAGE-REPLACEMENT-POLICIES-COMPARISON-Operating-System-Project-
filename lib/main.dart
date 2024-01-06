import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/data_provider.dart';
import 'Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderClass()),
      ],
      child: MaterialApp(
        title: 'Operating System Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          hoverColor: Colors.blueAccent,
          primaryColor: Colors.blue,
          // scaffoldBackgroundColor: const Color.fromARGB(255, 93, 145, 247),
          scaffoldBackgroundColor: const Color.fromARGB(255, 87, 164, 255),
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}
