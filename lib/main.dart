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
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Color.fromARGB(130, 5, 117, 255),
            cursorColor: Color.fromARGB(255, 87, 164, 255),
            selectionHandleColor: Color.fromARGB(255, 87, 164, 255),
          ),
          primarySwatch: Colors.blue,
          hoverColor: const Color.fromARGB(255, 3, 95, 255),

          primaryColor: Colors.blue,
          scaffoldBackgroundColor: const Color.fromARGB(255, 51, 135, 237),
          // scaffoldBackgroundColor: const Color.fromARGB(255, 87, 164, 255),
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}


// flutter build web --web-renderer html --release