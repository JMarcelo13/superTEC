import 'package:flutter/material.dart';
import 'package:supertec/home/productos.dart';
import 'package:supertec/home/perfil.dart'; // Importa tu archivo de perfil

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          const Productos(),
          PerfilScreen(
            nombreUsuario: 'Juan Pérez',
            correoUsuario: 'juan.perez@example.com',
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 75,
        shape: const CircularNotchedRectangle(),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  currentPage = 0;
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut);
                  setState(() {});
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: currentPage == 0 ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Inicio',
                        style: TextStyle(
                            color: currentPage == 0 ? Colors.white : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20), // Add space between buttons
            Expanded(
              child: GestureDetector(
                onTap: () {
                  currentPage = 1;
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut);
                  setState(() {});
                },
                child: SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_4_outlined,
                        color: currentPage == 1 ? Colors.white : Colors.grey,
                      ),
                      Text(
                        'Perfil',
                        style: TextStyle(
                            color: currentPage == 1 ? Colors.white : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
