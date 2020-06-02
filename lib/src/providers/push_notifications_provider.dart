import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    final _mensajesStreamController= StreamController<String>.broadcast();

    Stream<String> get mensajes => _mensajesStreamController.stream;
  
  initNotifications(){
  _firebaseMessaging.requestNotificationPermissions();

  _firebaseMessaging.getToken().then( (token){

    print('=====fFCM TOKEN0');
    print(token);

    //fLyYBjJLPVU:APA91bH2Prud65j1JQKCDYcWuf8C0wydqy63M1YI8-VBUZbrHYa2LrpFGNXvY0uxvJYhDwUkp17H5bqLIJjG-1OCYRvT33lfEf4t9U_KSyDRZd7tGMT-bq9eFsj-K8rML9-kQAMtAKz3
  });


  _firebaseMessaging.configure(

    onMessage: (info){

          print("===== on Message ===========");
          print(info);

            String argumento= 'no-data';
          if(Platform.isAndroid){
              argumento = info['data']['comida'] ?? 'no-data';
          }

          _mensajesStreamController.sink.add(argumento);
    },
    onLaunch:(info){

      print("===== on Launch ===========");
          print(info);
        

    } ,
    onResume: (info){

          print("===== on Resume ===========");
          print(info);

          final noti = info['data']['comida'];
         _mensajesStreamController.sink.add(noti);
    },


  );

}

dispose(){
  _mensajesStreamController?.close();
}

}