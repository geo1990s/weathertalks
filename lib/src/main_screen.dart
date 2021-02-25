
import 'package:flutter/material.dart';
//import 'package:sign_button/sign_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets/message_form.dart';
import 'widgets/message_wall.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'auth/android_auth_provider.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Weather Talks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final store = FirebaseFirestore.instance.collection('chat_messages');

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // bool _signedIn = false;
  // void _signIn() async {
  //   try {
  //     final creds = await AuthProvider().signInWithGoogle();
  //     print(creds);
  //     setState(() {
  //       _signedIn = true;
  //     });
  //   } catch (e) {
  //     print('Login Failed: $e');
  //   }
  // }

void _addMessage(String value) async {
  await widget.store.add({
    'author':'unknown',
    'author_id':3,
    'photo_url':'https://spracklinchiro.com/wp-content/uploads/2020/03/shutterstock_149293433.jpg',
    'timestamp': Timestamp.now().millisecondsSinceEpoch,
    'value':value,
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFBBDEFB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            //child: Container(),
            child: StreamBuilder<QuerySnapshot>(
              stream:widget.store 
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MessageWall(
                    messages: snapshot.data.docs,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          MessageForm(
            onSubmit: _addMessage,
          )
          //if(!_signedIn)
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   child: SignInButton(
            //     Buttons.Google,
            //     padding: const EdgeInsets.all(5),
            //     onPressed: _signIn,
            //   ),
            // ),
        ],
      ),
    );
  }
}
