import 'package:flutter/material.dart';
import 'package:pushlocal/src/providers/push_notifications_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


 @override
  void initState() { 
    super.initState();
    
    final pushProvider= PushNotificationProvider();
    pushProvider.initNotifications();
    
  }


  @override  
  Widget build(BuildContext context) {
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}