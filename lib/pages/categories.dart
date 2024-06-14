import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallify/pages/all_wallpaper.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Catogories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> AllWalpaper(
                          category: "Wildlife"
                      )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                       ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                         child: Image.asset(
                             "images/wildlife.jpg",
                           width: MediaQuery.of(context).size.width,
                           height: 180,
                           fit: BoxFit.cover,
                         ),
                       ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Wildlife",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        
        
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> AllWalpaper(
                          category: "Foods"
                      )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/food.jpg",
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Foods",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> AllWalpaper(
                          category: "Nature"
                      )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/nature.jpg",
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Nature",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        
        
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> AllWalpaper(
                          category: "City"
                      )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/city.jpg",
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "City",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
