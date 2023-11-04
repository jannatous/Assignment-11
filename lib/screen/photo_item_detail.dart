import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PhotoItemScreen extends StatefulWidget {
  String title,url;
  int id;
  PhotoItemScreen({required this.title, required this.url, required this.id});
  @override
  State<PhotoItemScreen> createState() => _PhotoItemScreenState();
}
class _PhotoItemScreenState extends State<PhotoItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Image.network(widget.url),
            SizedBox(height: 20,),
            Text("Title : ${widget.title}", style: TextStyle(fontSize: 17),),
            SizedBox(height: 20,),
            Center(child: Text("ID : ${widget.id}", style: TextStyle(fontSize: 17),))
          ],
        ),
      ),
    );
  }
}