import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_app/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  var fkey=GlobalKey<FormState>();

  TextEditingController name =TextEditingController();
  TextEditingController age =TextEditingController();
  TextEditingController address =TextEditingController();

  var gender ;
  bool english = false;
  bool malayalam = false;
  bool hindi = false;
  var language1 ;
  var language2 ;
  var language3 ;

  Future<void> saveData()async{
    SharedPreferences spname=await SharedPreferences.getInstance();
    spname.setString('name', name.text);
    spname.setString('age', age.text);
    spname.setString('address', address.text);
    spname.setString('gender', gender);
    spname.setString('language1', language1);
    spname.setString('language2', language2);
    spname.setString('language3', language3);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Registration')),),
      body: Form(
        key: fkey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: name,
          validator: (value) {
            if(value!.isEmpty){
              return
            'enter your name';
            }
          },
          decoration: InputDecoration(
          hintText: 'Name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20))),
    ),
        ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: age,
              validator: (value) {
                if(value!.isEmpty){
                  return
                      'enter your age';
                }
              },
              decoration: InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: address,
              validator: (value) {
                if(value!.isEmpty){
                  return
                      'enter your address';
                }
              },
              decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (v){
                          setState(() {
                            gender = v! ;
                            print(gender);
                          });//selected value
                        }
                    ),
                    Text('Male'),
                    Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (v){
                          setState(() {
                            gender = v! ;
                            print(gender);
                          });//selected value
                        }
                    ),
                    Text('Female'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Checkbox(value: english, onChanged: (value) {
                      setState(() {
                        english = value!;
                        if(english == true){
                          language1 = 'english';
                          print(language1);
                        }
                        else{
                          language1 = '-';
                        }
                      });
                    },),
                    Text('English'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Checkbox(value: malayalam, onChanged: (value) {
                      setState(() {
                        malayalam = value!;
                        if(malayalam == true){
                          language2 = 'malayalam';
                          print(language2);
                        }
                        else{
                          language2 = '-';
                        }
                      });
                    },),
                    Text('Malyalam'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Checkbox(
                      value: hindi, onChanged: (value) {
                        setState(() {
                          hindi = value!;
                          if(hindi == true){
                            language3 = 'hindi';
                            print(language3);
                          }
                          else{
                            language3 = '-';
                          }
                        });
                    },),
                    Text('Hindi'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(onPressed: () async {
                  await saveData();
                  if(fkey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const Home(),));
                  }
                }, child: const Text('Register')),
              )
        ]),
      ),
    );
  }
}
