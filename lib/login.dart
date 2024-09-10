import 'package:flutter/material.dart';
import 'package:supertec/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/logo.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                      labelStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 132, 132, 132)),
                      floatingLabelStyle:
                          TextStyle(color: Colors.white, fontSize: 17),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      prefixIcon:
                          Icon(Icons.email_outlined, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 132, 132, 132)),
                      floatingLabelStyle:
                          const TextStyle(color: Colors.white, fontSize: 17),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      prefixIcon: const Icon(Icons.password_outlined,
                          color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuPrincipal()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 222, 222, 222)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Ingresar a la tienda',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
