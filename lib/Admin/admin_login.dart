import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallify/Admin/add_wallpaper.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userPasswordController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
                padding: EdgeInsets.only(top: 45.0,left: 20.0,right: 20.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 53, 51, 51),
                      Colors.black
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                    MediaQuery.of(context).size.width, 110.0
                    )
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Let's start with\nAdmin",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height/2.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
        
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 30.0,),
                                Container(
                                  padding: EdgeInsets.only(left: 20,bottom: 5,top: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                            
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 160, 60, 147),
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                            
                                  child: Center(
                                    child: TextFormField(
                                      controller: userNameController,
                                      validator: (value){
                                        if(value == null || value.isNotEmpty){
                                        return 'Please Enter Username';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(255, 160, 160, 147)
                                        )
                                      ) ,
                                    ),
                                  ),
                                ),
                            
                                SizedBox(height: 30.0,),
                                Container(
                                  padding: EdgeInsets.only(left: 20,bottom: 5,top: 5),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                            
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 160, 60, 147),
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                            
                                  child: Center(
                                    child: TextFormField(
                                      controller: userPasswordController,
                                      validator: (value){
                                        if(value == null || value.isNotEmpty){
                                          return 'Please Enter Password';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(255, 160, 160, 147)
                                          )
                                      ) ,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.0,),
                                GestureDetector(
                                  onTap: (){
                                    LoginAdmin();
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
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  LoginAdmin(){
    FirebaseFirestore.instance.collection("Admin")
        .get()
        .then((snapshot) {
          snapshot.docs.forEach((result) {
            if(result.data()['id'] != userNameController.text.trim()){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                    "Your id is Not correct",
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
              ));
            }
            if(result.data()['password'] != userPasswordController.text.trim()){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  "Your password is Not correct",
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
              ));
            }else{
              Route route = MaterialPageRoute(builder: (context) => AddWallpaper());
              Navigator.pushReplacement(context, route);
            }
          });
    });
  }


}
