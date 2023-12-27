import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/utility/mybutton.dart';
import 'package:flutter_application_5/pages/utility/myimage.dart';
import 'package:flutter_application_5/pages/singup.dart';
import 'package:flutter_application_5/pages/utility/texetHead.dart';
import 'package:flutter_application_5/pages/utility/textField.dart';


class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _singin() async{
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, 
        password: _passwordController.text);
        
      } catch (e) {
        print(e);
        
      }


    }
    return Scaffold(
      body: ListView(
        children: [
          MyImage(imagesrc: 'images/mylogin.png', 
          imageHiegth: 300),
          Container(
            padding: EdgeInsets.only(top: 10,left: 20,right: 20),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHead(headerText: 'Login',isFontWeight: true,
                fontSize: 40,),
                SizedBox(
                  height: 30,
                ),
                MyTextFild(
                  myController:_emailController,
                  hintText: 'Email ID', 
                prefixIcon: Icon(Icons.alternate_email_outlined)),
                SizedBox(
                  height: 30,
                ),
                MyTextFild(
                  myController:_passwordController,
                  hintText: 'Password', 
                prefixIcon: Icon(Icons.lock),
                obscureText: true,),
                SizedBox(height: 30,),
                MyButton(
                  onTap: _singin,
                  btnText: 'Login',),
                SizedBox(height: 45,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New User Please? ',
                    style: TextStyle(fontSize: 25),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> Singup()));
                      },
                      child: Text(
                        'Registor',style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 14, 103, 176),
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}