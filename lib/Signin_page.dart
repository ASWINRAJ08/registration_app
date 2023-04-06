import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_app/Registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  var fkey=GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> saveData()async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    spname.setString('username', username.text);
    spname.setString('password', password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text('Sign In')),
      ),
      body: SafeArea(
        child: Form(
          key: fkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: username,
                  validator: (value) {
                    if(value!.isEmpty){
                      return
                        'enter your username';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'User name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return
                      'enter your password';
                }
              },
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
              ElevatedButton(onPressed: () async {
                await saveData();
                if(fkey.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Registration(),));
                }
              }, child: Text('Sign In'))
            ],
          ),
        ),
      ),
    );
  }
}
