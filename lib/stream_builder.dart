import 'dart:async';

import 'package:flutter/material.dart';
class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({Key? key}) : super(key: key);

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {

 List<String> list = [];
 StreamsSocket streamsSocket = StreamsSocket();
 TextEditingController messageController = TextEditingController();

 Stream<DateTime> generateNumber()async*{

   while(true){
     await Future.delayed(Duration(seconds: 3));
     yield DateTime.now();
   }

 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add('sm graphics');
streamsSocket.addResponse(list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: streamsSocket.getResponse,
                builder: (context,AsyncSnapshot<List<String>> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done){

                  if(snapshot.hasError){
                    return Text(snapshot.error.toString());
                  }else if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: list.length,
                        itemBuilder: (context, index){
                          return Text(snapshot.data![index].toString());
                        }
                    );
                  }else{
                    return Text('something has happen');
                  }

                }else{
                  return Text('something has happen');
                }

                }
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                    hintText: 'Enter message'
                ),
              ),
              ),

              IconButton(onPressed: (){
                list.add(messageController.text.toString());
                streamsSocket.addResponse(list);
                messageController.clear();
              }, icon: Icon(Icons.send)),
            ],
          ),
        ],
      ),
    );
  }

}

class StreamsSocket{

  final _stream = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => _stream.sink.add;

  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
