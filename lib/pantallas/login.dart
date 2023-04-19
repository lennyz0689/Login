//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:login/widget/decoration.dart';

class LoginPantalla extends StatelessWidget {
 const LoginPantalla({ Key? key}) : super(key : key);

 @override
  Widget build(BuildContext  context){
   final size = MediaQuery.of(context).size;
   return Scaffold(
     body: SizedBox(
       width: double.infinity,
       height: double.infinity,
       child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(63, 63, 156, 1),
                  Color.fromRGBO(90, 70, 178, 1),
                ])),
              width: double.infinity,
              height: size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(top: 90, left: 30, child: borbuja()),
                  Positioned(top: -40, left: -30, child: borbuja()),
                  Positioned(top: -50, right: -20, child: borbuja()),
                  Positioned(bottom: -50, left: 10, child: borbuja()),
                  Positioned(bottom: 120, right: 20, child: borbuja()),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                child: const Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                  children: [
                    const SizedBox(height: 250),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      //height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0,5),
                          )
                        ]),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text('Iniciar sesión', style: Theme.of(context).textTheme.headline4),
                          const SizedBox(height: 30),
                          Container(
                            child: Form(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  TextFormField(
                                    autocorrect: false,
                                    decoration: InputDecorations.inputDecoration(
                                        hintext: 'ejemplo@gmail.com',
                                        labelText: 'Email',
                                        icon: const Icon(Icons.alternate_email_rounded)),
                                    validator: (value){
                                      String pattern =
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                          RegExp regExp = new RegExp(pattern);
                                          return regExp.hasMatch(value ?? '')
                                              ? null
                                              : 'El valor ingresado no es un correo';
                                    },
                                  ),
                                  const SizedBox(height: 30),
                              TextFormField(
                                  autocorrect: false,
                                  obscureText: true,
                                  decoration: InputDecorations.inputDecoration(
                                      hintext: '********',
                                      labelText: 'Password',
                                      icon: const Icon(Icons.lock_outline)),
                                validator: (value){
                                    return (value != null && value.length >= 8)
                                        ? null
                                        : 'La contraseña debe ser mayor o igual a 8 caracteres';
                                },
                              ),
                                  const SizedBox(height: 30),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    disabledColor: Colors.grey,
                                    color: Colors.deepPurple,
                                    child: Container(
                                      padding:  const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 15),
                                      child: const Text('Ingresar', style: TextStyle(color: Colors.white),),
                                    ),
                                    onPressed: (){},
                                  )
                                ],
                              )
                            ),
                          )
                        ],
                      )),
                    const SizedBox(height: 50),
                    const Text('¿No tienes una cuenta?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
              ),
            )
          ],
       ),
     ),
   );
 }

 Container borbuja() {
   return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(255, 255, 255, 0.05)),
                );
 }
}