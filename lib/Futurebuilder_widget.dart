import 'package:flutter/material.dart';
class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {

  Future<DateTime> futureFunction()async{
     await Future.delayed(Duration(seconds: 2));
      return DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futurebuilder Widget'),
      ),
      body: Column(
      children: [
        TextButton(
            onPressed: (){
              futureFunction();
              setState(() {

              });
            },
            child: Text('click me'),
        ),
        FutureBuilder(
          future: futureFunction(),
            builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.connectionState ==ConnectionState.done ||
                snapshot.connectionState ==ConnectionState.active ){
              if(snapshot.hasError){
                  return Text(snapshot.hasError.toString());
              }else if(snapshot.hasData){
                return Text(snapshot.data.toString());
              }else{
                return Text('Something went wrong');
              }

            }else{
              return Text(snapshot.connectionState.toString());
            }
            }
        ),
      ],
      ),
    );
  }
}
