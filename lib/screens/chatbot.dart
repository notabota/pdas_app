import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../constants.dart';
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();
  List<String> _data = [];
  // static const String BOT_URL = "http://192.168.0.89:3000/get";
  TextEditingController queryController = TextEditingController();

  late Socket socket;

  @override

  void initState(){
    super.initState();
    debugPrint("initState() called");
    socket = IO.io('https://nodejs-khkt20222023.herokuapp.com/',
        IO.OptionBuilder()
            .setTransports(['websocket']).build());
    connect_();
  }

  void connect_(){
    // debugPrint('connect');
    String res = "hi";
    socket.connect();
    socket.onConnect((_) {
      debugPrint('connect');
      // socket.emit('fromClient', res);

    });
    socket.on("fromServer", (data) =>{
      debugPrint(data),
      insertSingleItem(data + "<bot>")
    });
    socket.onDisconnect((_) => debugPrint('disconnect'));
  }

  Widget build(BuildContext context){
    // socket.on("fromServer", (data) =>{
    //   debugPrint(data),
    //   insertSingleItem(data + "<bot>")
    // });
    // debugPrint("12");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 0,
            title: Text("Liên hệ bác sĩ"),
            backgroundColor: Colors.transparent,
          )
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: 780,
              child: AnimatedList(
                key: _listkey,
                initialItemCount: _data.length,
                itemBuilder: (BuildContext context, int index, Animation<double> animation){
                  return buildItem(_data[index], animation, index, context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: Container(
                color: bgColor.withOpacity(0.6),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.message,
                        color: Colors.white70,
                      ),
                      hintText: "Nhập ở đây",
                      fillColor: Colors.white70,
                    ),
                    autocorrect: false,
                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white70),
                    controller: queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg){
                      this.getResponse();
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getResponse(){
    if (queryController.text.length > 0){
      this.insertSingleItem(queryController.text);
      var client = getClient();
      // socket.onConnect((_) {
      //   debugPrint('connect');
      //   socket.emit('fromClient', queryController.text);
      // });
      socket.emit('fromClient', queryController.text);
      // insertSingleItem(queryController.text + "<bot>");
      queryController.clear();
      // try{
      //   client.post(
      //     BOT_URL,
      //     body: {"response": queryController.text},
      //
      //   )..then((response){
      //     print(response.body);
      //     Map<String, dynamic> data = jsonDecode(response.body);
      //     insertSingleItem(data['response'] + "<bot>");
      //     // print(data['response']);
      //   });
      // }
      // finally{
      //   client.close();
      //   queryController.clear();
      // }
    }
  }

  void insertSingleItem(String message){
    _data.add(message);
    _listkey.currentState?.insertItem(_data.length - 1);
  }
  http.Client getClient(){
    return http.Client();
  }
}

Widget buildItem(String item, Animation<double> animation, int index, BuildContext context){
  bool mine = item.endsWith("<bot>");
  String t1 = "RAU MUỐNG";
  String t2 = "RAU XÀ LÁCH";
  String t3 = "Cây rau";
  return SizeTransition(
    child: Padding(
      padding: EdgeInsets.only(top: 10, right: 15, left: 15),
      child: Container(
        alignment: mine ? Alignment.topLeft : Alignment.topRight,
        child: Bubble(
          child: Text(
            item.replaceAll(("<bot>"), ""),
            style: TextStyle(
              fontSize: 30,
              color: mine ? Colors.white : Colors.black,
            ),
          ),
          color: mine ? Colors.blue : Colors.white70,
          padding: BubbleEdges.all(10),
        ),
      ),
    ),
    sizeFactor: animation,
  );
}