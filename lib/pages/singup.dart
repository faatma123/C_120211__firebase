import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/utility/mybutton.dart';

import 'package:flutter_application_5/pages/utility/myimage.dart';
import 'package:flutter_application_5/pages/utility/texetHead.dart';
import 'package:flutter_application_5/pages/utility/textField.dart';

class Singup extends StatefulWidget {
  Singup({super.key});

  @override
  State <Singup> createState() =>_SingupState();
}

class _SingupState extends State<Singup> {
  final TextEditingController _emailController=TextEditingController();

  final TextEditingController _passwordController =TextEditingController();

    final TextEditingController _confrmpasswordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _showError(msg){
      showDialog(context: context,
       builder: (context){
        return Center(
          child: AlertDialog(title: Text(msg),)
        );
       }
       );
    }

    void _signup()async{
      if(_passwordController.text==_confrmpasswordController.text){
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, 
          password: _passwordController.text);
        } on FirebaseAuthException  catch (e) {
            if (e.code == 'weak-password') {
               _showError('The password provided is too weak.');
             } else if (e.code == 'email-already-in-use') {
             _showError('The account already exists for that email.');
  }
          
 
} catch (e) {
  print(e);
}

      }else{
        _showError('password is not matching');

      }

    }
    return Scaffold(
      body: ListView(
        children: [
          MyImage(
            imagesrc: 'images/signup.png', 
            imageHiegth: 300),
            Container(
              padding: EdgeInsets.only(top: 10,right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                TextHead(headerText: 'Sing Up',
                isFontWeight: true,
                fontSize: 40,),
                SizedBox(height: 30,),
                MyTextFild(
                  myController: _emailController,
                  hintText: 'Email ID', 
                prefixIcon: Icon(Icons.alternate_email_outlined)),
                SizedBox(height: 30,),
                MyTextFild(
                  myController: _passwordController,
                  hintText: 'Password', 
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,),
                  SizedBox(height: 30,),
                  MyTextFild(
                    myController: _confrmpasswordController,
                    
                    hintText: 'confirm password', 
                    
                     obscureText: true,
                    prefixIcon: Icon(Icons.person_2_outlined)),
                    
                    SizedBox(height: 30,),
                    MyButton(
                      onTap: _signup,
                      btnText: 'Sing Up'),
                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I have Acount? ',style: TextStyle(
                          fontSize: 25,

                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text('Login',style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),),
                        )
                      ],
                    )

              ]),
            )
        ],
      ),
    );
  }
}