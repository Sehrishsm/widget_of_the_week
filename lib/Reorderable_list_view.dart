
import 'package:flutter/material.dart';
class ReorderAbleListView extends StatefulWidget {
  const ReorderAbleListView({Key? key}) : super(key: key);

  @override
  State<ReorderAbleListView> createState() => _ReorderAbleListViewState();
}

class _ReorderAbleListViewState extends State<ReorderAbleListView> {

  List<String> _productList = ['Orange', 'Mango', 'Grapes', 'Pineapple', 'Cherry','Strawberry' ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kinda.com'),
        centerTitle: true,
      ),
      body: ReorderableListView.builder(
          itemBuilder: (context, index){
            return Card(
              key: ValueKey(_productList[index]),
              child: ListTile(
                title:Text(_productList[index]),
              ),
            );
          },
          itemCount: _productList.length,
          onReorder: (oldIndex, newIndex){
           setState(() {
             if(newIndex > oldIndex){
               newIndex= newIndex -1;
             }
             final element = _productList.removeAt(oldIndex);
             _productList.insert(newIndex, element);
           });
          }
      ),
    );
  }
}
