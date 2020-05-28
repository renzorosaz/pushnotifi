import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

initNotifications(){
  _firebaseMessaging.requestNotificationPermissions();

  _firebaseMessaging.getToken().then( (token){

    print('=====fFCM TOKEN0');
    print(token);

    //fLyYBjJLPVU:APA91bH2Prud65j1JQKCDYcWuf8C0wydqy63M1YI8-VBUZbrHYa2LrpFGNXvY0uxvJYhDwUkp17H5bqLIJjG-1OCYRvT33lfEf4t9U_KSyDRZd7tGMT-bq9eFsj-K8rML9-kQAMtAKz3
  });
}
}