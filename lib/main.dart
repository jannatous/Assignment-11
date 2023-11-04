import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_untitled/screen/photo_gallery_list.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoGalleryListScreen(),
    );
  }
}