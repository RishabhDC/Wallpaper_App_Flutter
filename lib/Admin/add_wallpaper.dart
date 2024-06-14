import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:wallify/service/database.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoryItems = ['Wildlife','Foods','Nature','City'];
  String? value;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async{
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {

    });
  }

  uploadItem()async{
    if(selectedImage != null){
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref().child("blogImages")
      .child(addId);

      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await(await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Id": addId,
      };
      await DatabaseMethods().addWallpaper(
          addItem,
          addId,
          value!
      ).then((value) {
        Fluttertoast.showToast(
            msg: "Wallpaper has been Added Successfully!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
              Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Wallpaper",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
             children: [
               SizedBox(height: 20,),
               selectedImage == null? GestureDetector(
                 onTap: (){
                   getImage();
                 },
                 child: Center(
                    child: Material(
                      elevation: 4.0,
                       borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
               ): Center(
                 child: Material(
                   elevation: 4.0,
                   borderRadius: BorderRadius.circular(20),
                   child: Container(
                     width: 250,
                     height: 300,
                     decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.black,
                           width: 1.5,
                         ),
                         borderRadius: BorderRadius.circular(20)
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.file(
                           selectedImage!,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 40,),
               Container(
                 margin: EdgeInsets.only(left: 20,right: 20),
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: Color(0xFFececf8),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton<String>(
                     items: categoryItems.map((item) => DropdownMenuItem<String>(
                        value: item,
                       child: Text(
                           item,
                         style: TextStyle(
                           fontSize: 18,
                           color: Colors.black
                         ),
                       ),
                     )).toList(),
                     onChanged: ((value)=> setState(() {
                       this.value = value;
                     })),
                     hint: Text('Select Category'),
                     value: value,
                   ),
                 ),
               ),
               SizedBox(height: 40,),
               GestureDetector(
                 onTap: (){
                     uploadItem();
                 },
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 12),
                   margin: EdgeInsets.symmetric(horizontal: 20),
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Center(
                     child: Text(
                       "ADD",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                       ),
                     ),
                   ),
                 ),
               )

             ],
          ),
        ),
      ),
    );
  }
}