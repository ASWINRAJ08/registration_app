import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_app/Signin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var fkey=GlobalKey<FormState>();

  var name;
  var age ;
  var address;
  var gender;
  var username;
  var password;
  var language1;
  var language2;
  var language3;

  Future<dynamic>getData() async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    username = spname.getString('username');
    password = spname.getString('password');
    name = spname.getString('name');
    age = spname.getString('age');
    address = spname.getString('address');
    gender = spname.getString('gender');
    language1 = spname.getString('language1');
    language2 = spname.getString('language2');
    language3 = spname.getString('language3');
  }

  clear() async {
    SharedPreferences spname=await SharedPreferences.getInstance();
    spname.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Signin();
    },));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Text('Sign Out'),
          IconButton(onPressed: () {
            clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Signin(),));
          }, icon: const Icon(Icons.logout_outlined))
        ],
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(ConnectionState == ConnectionState.waiting){
            return
                CircularProgressIndicator();
          }
          else {
            return
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 300,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(color: Colors.blueGrey[50]),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('User name : '),
                              Text(username),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Password : '),
                              Text(password),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Name : '),
                              Text(name),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Gender : '),
                              Text(gender),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Age : '),
                              Text(age),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Address : '),
                              Text(address),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Languages : '),
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(language1),
                                Text(language2),
                                Text(language3),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              );
          }
        },
      )
    );
  }
}
