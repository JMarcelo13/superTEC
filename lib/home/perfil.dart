import 'package:flutter/material.dart';
import 'package:supertec/home/datos_personales.dart';
import 'package:supertec/home/direcciones.dart';
import 'package:supertec/home/mis_compras.dart';
import 'package:supertec/login.dart';

class PerfilScreen extends StatefulWidget {
  final String nombreUsuario;
  final String correoUsuario;

  const PerfilScreen({
    Key? key,
    required this.nombreUsuario,
    required this.correoUsuario,
  }) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi cuenta'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            color: Colors.grey[300],
            child: Text(
              'Hola, ${widget.nombreUsuario}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildListTile(
                  icon: Icons.person,
                  title: 'Datos personales',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DatosPersonalesScreen(
                          nombre: 'Juan', // Pasa aquí el valor de nombre
                          apellidoPaterno:
                              'Perez', // Pasa aquí el valor de apellidoPaterno
                          apellidoMaterno:
                              'Gomez', // Pasa aquí el valor de apellidoMaterno
                          dni: '12345678', // Pasa aquí el valor del DNI
                          celular: '987654321', // Pasa aquí el valor de celular
                          email:
                              'juan.perez@example.com', // Pasa aquí el valor del email
                        ),
                      ),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.shopping_bag,
                  title: 'Mis compras',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ComprasScreen(), // Ahora es válido
                      ),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.location_on,
                  title: 'Direcciones',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                           DireccionesScreen(), // Ahora es válido
                      ),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.payment,
                  title: 'Medios de pago',
                  onTap: () {
                    // Acción al presionar
                  },
                ),
                _buildListTile(
                  icon: Icons.local_offer,
                  title: 'Cupones',
                  onTap: () {
                    // Acción al presionar
                  },
                ),
                _buildListTile(
                  icon: Icons.attach_money,
                  title: 'Datos para reembolso',
                  onTap: () {
                    // Acción al presionar
                  },
                ),
                _buildListTile(
                  icon: Icons.lock,
                  title: 'Cambiar mi contraseña',
                  onTap: () {
                    // Acción al presionar
                  },
                ),
                _buildListTile(
                  icon: Icons.logout,
                  title: 'Cerrar sesión',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }
}
