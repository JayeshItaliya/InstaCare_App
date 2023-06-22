import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8,right: 8),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.clear,size: 30,color: Colors.white),
                  Icon(Icons.clear,size: 30,color: Colors.white),
                  Icon(Icons.clear,size: 30,color: Colors.white),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8,right: 8),
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("0",style: TextStyle(color: Colors.white,fontSize: 30)),
                  Text("0",style: TextStyle(color: Colors.white,fontSize: 30)),
                  Text("0",style: TextStyle(color: Colors.white,fontSize: 30)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8,right: 8),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.clear,size: 30,color: Colors.white),
                  Icon(Icons.clear,size: 30,color: Colors.white),
                  Icon(Icons.clear,size: 30,color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
