import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../models/photo_model.dart';
import 'package:http/http.dart' as http;

import '../widget/widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<PhotosModel> photos = [];
  TextEditingController searchController = new TextEditingController();
  bool search = false;

getSearchWallpaper(String searchQuery) async{
  await http.get(
     Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery&per_page=50"),
    headers: {"Authorization" : "lhkC4Uh0mmUTS3UCzg3yNYTst0eRbFTyVJzE9QZqmVnffbCyQCmIqkfe"}).then((value){
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element){
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });

      setState(() {
         search = true;
      });

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Search",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10),
              ),
                child: TextField(
                  controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: (){
                      getSearchWallpaper(searchController.text);
                    },
                    child: search? GestureDetector(
                      onTap: (){
                        photos = [];
                        search = false;
                        setState(() {

                        });
                      },
                      child: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 84, 87, 93)
                      ),
                    ) : Icon(
                        Icons.search_outlined,
                        color: Color.fromARGB(255, 84, 87, 93)
                    ),
                  ),
                  hintText: "Search Your Image Here!!"

                ),
                ),
            ),
            SizedBox(height: 20.0,),
            Expanded(child: wallpaper(photos, context)),
          ],
        ),
      ),
    );
  }
}