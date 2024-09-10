import 'package:flutter/material.dart';

class DireccionesScreen extends StatefulWidget {
  @override
  _DireccionesScreenState createState() => _DireccionesScreenState();
}

class _DireccionesScreenState extends State<DireccionesScreen> {
  List<String> direcciones = [
    '1, Calle Capilla Belen, SAN JUAN DE LURIGANCHO, LIMA'
  ];
  String direccionFavorita = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direcciones'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Mostrar las direcciones guardadas
          ...direcciones.map((direccion) {
            return ListTile(
              title: Text(direccion),
              leading: Radio<String>(
                value: direccion,
                groupValue: direccionFavorita,
                onChanged: (value) {
                  setState(() {
                    direccionFavorita = value!;
                  });
                },
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'editar') {
                    _editarDireccion(direccion);
                  } else if (value == 'eliminar') {
                    _eliminarDireccion(direccion);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'editar',
                    child: Text('Editar'),
                  ),
                  const PopupMenuItem(
                    value: 'eliminar',
                    child: Text('Eliminar'),
                  ),
                ],
                icon: const Icon(Icons.more_vert),
              ),
            );
          }).toList(),
          
          const SizedBox(height: 20),

          // Botón para agregar otra dirección
          TextButton.icon(
            icon: const Icon(Icons.add, color: Colors.blue),
            label: const Text('Agregar otra dirección', style: TextStyle(color: Colors.blue)),
            onPressed: () {
              _agregarNuevaDireccion();
            },
          ),
        ],
      ),
    );
  }

  // Función para agregar una nueva dirección
  void _agregarNuevaDireccion() {
    showDialog(
      context: context,
      builder: (context) {
        String nuevaDireccion = '';
        return AlertDialog(
          title: const Text('Agregar nueva dirección'),
          content: TextField(
            onChanged: (value) {
              nuevaDireccion = value;
            },
            decoration: const InputDecoration(hintText: 'Ingresa la dirección'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (nuevaDireccion.isNotEmpty) {
                  setState(() {
                    direcciones.add(nuevaDireccion);
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  // Función para editar una dirección
  void _editarDireccion(String direccion) {
    TextEditingController _controller = TextEditingController(text: direccion);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar dirección'),
          content: TextField(
            controller: _controller,
            onChanged: (value) {
              direccion = value;
            },
            decoration: const InputDecoration(hintText: 'Editar la dirección'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  int index = direcciones.indexOf(direccion);
                  if (index != -1) {
                    direcciones[index] = _controller.text;
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // Función para eliminar una dirección
  void _eliminarDireccion(String direccion) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar dirección'),
          content: const Text('¿Estás seguro de que deseas eliminar esta dirección?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  direcciones.remove(direccion);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
