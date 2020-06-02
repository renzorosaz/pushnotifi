import 'package:flutter/material.dart';
import 'package:pushlocal/src/providers/pages/home_page.dart';
import 'package:pushlocal/src/providers/pages/mensaje_page.dart';
import 'package:pushlocal/src/providers/push_notifications_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();



 @override
  void initState() { 
    super.initState();
    
    final pushProvider= PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.mensajes.listen((argumento) {
      
      /* Navigator.pushNamed(context,'mensaje'); */
        print('argumento del push');
        print(argumento);

        navigatorKey.currentState.pushNamed('mensaje',arguments:argumento);
    });
    
  }


  @override  
  Widget build(BuildContext context) {
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'PushLocal',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mensaje': (BuildContext context) => MensajePage(),
      },
    );
  }
}