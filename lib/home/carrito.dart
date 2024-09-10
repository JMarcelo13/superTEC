import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  const Carrito({super.key});

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  final List<Map<String, dynamic>> _itemsCarrito = [
    {"nombre": "Iphone 15 pro 256gb", "precio": 4000.00, "cantidad": 1},
    {"nombre": "Samsung Galaxy S23 Ultra", "precio": 2500.00, "cantidad": 1},
    {"nombre": "Google Pixel 8 pro", "precio": 3000.00, "cantidad": 1},
  ];

  double get _precioTotal {
    return _itemsCarrito.fold(0.0, (sum, item) => sum + (item["precio"] * item["cantidad"]));
  }

  int get _totalItems {
    return _itemsCarrito.fold(0, (sum, item) => sum + (item["cantidad"] as int));
  }

  void _incrementarCantidad(int index) {
    setState(() {
      _itemsCarrito[index]["cantidad"]++;
    });
  }

  void _disminuirCantidad(int index) {
    setState(() {
      if (_itemsCarrito[index]["cantidad"] > 1) {
        _itemsCarrito[index]["cantidad"]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEncabezado(),
            Expanded(
              child: ListView.builder(
                itemCount: _itemsCarrito.length,
                itemBuilder: (context, index) {
                  return _buildItemCarrito(index);
                },
              ),
            ),
            _buildResumenTotal(),
            _buildBotonPagar(),
          ],
        ),
      ),
    );
  }

  Widget _buildEncabezado() {
    return Container(
      margin: const EdgeInsets.only(bottom: 18.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Productos seleccionados: $_totalItems",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCarrito(int index) {
    final item = _itemsCarrito[index];

    return Card(
      color: const Color.fromARGB(255, 245, 245, 245),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["nombre"],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${item["precio"].toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 44, 44, 44)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, color: Color.fromARGB(255, 44, 44, 44)),
                  onPressed: () => _disminuirCantidad(index),
                ),
                Text(
                  '${item["cantidad"]}',
                  style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 44, 44, 44)),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Color.fromARGB(255, 44, 44, 44)),
                  onPressed: () => _incrementarCantidad(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumenTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total a pagar:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${_precioTotal.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
    );
  }

  Widget _buildBotonPagar() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Acción para proceder al pago
        },
        style: ElevatedButton.styleFrom(
         backgroundColor  : Colors.black, // Fondo negro
          foregroundColor : Colors.white, // Texto blanco
          padding: const EdgeInsets.symmetric(vertical: 25.0),
        ),
        child: const Text('Proceder al Pago'),
      ),
    );
  }
}
