import 'package:flutter/material.dart';
import 'package:supertec/home/carrito.dart';

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                'Productos'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Buscar productos...',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 132, 132, 132)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  prefixIcon: Icon(Icons.search_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    child: const Card(
                        color: Color.fromARGB(255, 158, 64, 64),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PRONTO HABRÁN',
                                style: TextStyle(
                                    fontFamily: 'NewAmsterdam',
                                    color: Colors.white,
                                    fontSize: 45,
                                    height: 0),
                              ),
                              Text(
                                'NUEVOS PRODUCTOS',
                                style: TextStyle(
                                    fontFamily: 'NewAmsterdam',
                                    color: Colors.white,
                                    fontSize: 25,
                                    height: 0),
                              )
                            ],
                          ),
                        )),
                  ),
                  CardProducto(
                    imageUrl: 'assets/img/img1.jpg',
                    title: 'iPhone 15 Pro 256gb',
                    description:
                        'Forjado en titanio y equipado con el revolucionario chip A17 Pro y el sistema de cámaras Pro más versátil',
                    onAddToCart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Carrito()),
                      );
                    },
                  ),
                  CardProducto(
                    imageUrl: 'assets/img/img2.jpg',
                    title: 'Samsung Galaxy S23 Ultra',
                    description:
                        'El último en tecnología de cámaras y rendimiento con el chip Snapdragon 8 Gen 2.',
                    onAddToCart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Carrito()),
                      );
                    },
                  ),
                  CardProducto(
                    imageUrl: 'assets/img/img3.jpg',
                    title: 'Google Pixel 8 Pro',
                    description:
                        'Una experiencia pura de Android con una cámara avanzada y un diseño elegante.',
                    onAddToCart: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Carrito()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProducto extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onAddToCart;

  const CardProducto({
    this.imageUrl = '',
    this.title = '',
    this.description = '',
    this.onAddToCart = _defaultOnAddToCart,
    super.key,
  });

  static void _defaultOnAddToCart() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: onAddToCart,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Agregar al carrito',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}