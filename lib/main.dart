import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipointproject/presentation/screens/tab.dart';
import 'package:monipointproject/presentation/share/tabscreen_provider.dart';
import 'package:provider/provider.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark // Change this color as needed
        ));
         SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => 
  runApp(MultiProvider(

    providers: [
       ChangeNotifierProvider(create: (context) => TabScreenNotifier()),
    ],
    child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:  (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MoniPoint take home',
          theme: ThemeData(
           
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Tabscreen(),
        );
      }
    );
  }
}
