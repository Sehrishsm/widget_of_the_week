import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainers extends StatefulWidget {
  const AnimatedContainers({Key? key}) : super(key: key);

  @override
  State<AnimatedContainers> createState() => _AnimatedContainersState();
}

class _AnimatedContainersState extends State<AnimatedContainers> {

  double height = 100;
  double width = 100;
  Color color = Colors.green;
  BorderRadiusGeometry radiusGeometry= BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(

        child: AnimatedContainer(
          height: height,
          width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: radiusGeometry,
        ),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        final random =Random();
        height= random.nextInt(300).toDouble();
        width = random.nextInt(300).toDouble();

        color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1
        );

        radiusGeometry= BorderRadius.circular(random.nextInt(100).toDouble());
        setState(() {

        });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
