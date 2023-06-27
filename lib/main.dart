import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/widgets/Search.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
 
  runApp(const MyApp());
 

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
            theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(27, 128, 128, 128),brightness: Brightness.dark
          
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title:  Text("MyWeather",
          style: GoogleFonts.getFont("Pacifico"), ),
            backgroundColor:const  Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/wallpaper.jpg"),
                    fit: BoxFit.contain,
                    opacity: 0.50),
              ),
            ),
            SearchClass(),
          ],
        ),
      ),
    );
  }
}

