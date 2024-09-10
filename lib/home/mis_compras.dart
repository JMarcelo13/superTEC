import 'package:flutter/material.dart';

class ComprasScreen extends StatelessWidget {
  const ComprasScreen({Key? key}) : super(key: key); // Constructor const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis compras'), // Constante
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey[900], // Card es inmutable
              child: const ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.white), // Constante
                title: Text(
                  '28 de julio',
                  style: TextStyle(color: Colors.white), // Constante
                ),
                subtitle: Text(
                  'Entregado el 03 de Agosto',
                  style: TextStyle(color: Colors.white70), // Constante
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.white, // Constante
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                    // Navegar a la pantalla de Datos Personales
                  },
                ),
                _buildListTile(
                  icon: Icons.shopping_bag,
                  title: 'Mis compras',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComprasScreen(), // Constante aquí
                      ),
                    );
                  },
                ),
                _buildListTile(
                  icon: Icons.location_on,
                  title: 'Direcciones',
                  onTap: () {
                    // Acción al presionar
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
                    // Acción al presionar
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para crear los ListTiles de manera eficiente
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
