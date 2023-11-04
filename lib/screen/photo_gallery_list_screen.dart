import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_untitled/screen/photo_item_detail.dart';
import 'package:http/http.dart' as http;

class PhotoGalleryListScreen extends StatefulWidget {
  const PhotoGalleryListScreen({super.key});
  @override
  State<PhotoGalleryListScreen> createState() => _PhotoGalleryListScreenState();
}

class _PhotoGalleryListScreenState extends State<PhotoGalleryListScreen> {
  List<Photos> photoList = [];
  Future<List<Photos>> getPhotos()async{
    try{
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode ==200){
        for(Map i in data){
          Photos photos = Photos(title: i["title"],
              id: i['id'],
              url: i["url"]);
          photoList.add(photos);
        }return photoList;
      }else{
        throw Exception('Failed to load photos');
      }
    }catch(e){
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("phooto Gallery App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getPhotos(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    return ListView.separated(
                      itemCount: photoList.length,
                      separatorBuilder: (context, index)=>Divider(),
                      itemBuilder: (context, index){
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoItemScreen(title: snapshot.data![index].title.toString(),
                              url: snapshot.data![index].url.toString(),
                              id: snapshot.data![index].id,

                            )));
                          },
                          leading: Image.network(photoList[index].url.toString()),
                          title: Text(photoList[index].title.toString(),style: TextStyle(fontSize: 17),),

                        );
                      },
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Photos{
  String title, url;
  int id;
  Photos({
    required this.title,
    required this.id,
    required this.url,
  });
}