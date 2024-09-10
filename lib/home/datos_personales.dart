import 'package:flutter/material.dart';
import 'package:supertec/login.dart'; // Asegúrate de importar correctamente tu archivo de login

class DatosPersonalesScreen extends StatefulWidget {
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String dni;
  final String celular;
  final String email;

  const DatosPersonalesScreen({
    Key? key,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.dni,
    required this.celular,
    required this.email,
  }) : super(key: key);

  @override
  _DatosPersonalesScreenState createState() => _DatosPersonalesScreenState();
}

class _DatosPersonalesScreenState extends State<DatosPersonalesScreen> {
  late TextEditingController nombreController;
  late TextEditingController apellidoPaternoController;
  late TextEditingController apellidoMaternoController;
  late TextEditingController celularController;
  late TextEditingController emailController;

  bool hasChanged = false; // Variable para habilitar el botón Guardar

  // Variables locales para almacenar los valores actuales
  late String nombre;
  late String apellidoPaterno;
  late String apellidoMaterno;
  late String celular;
  late String email;

  @override
  void initState() {
    super.initState();

    // Inicializa las variables locales con los valores del widget
    nombre = widget.nombre;
    apellidoPaterno = widget.apellidoPaterno;
    apellidoMaterno = widget.apellidoMaterno;
    celular = widget.celular;
    email = widget.email;

    // Inicializa los controladores con los valores locales
    nombreController = TextEditingController(text: nombre);
    apellidoPaternoController = TextEditingController(text: apellidoPaterno);
    apellidoMaternoController = TextEditingController(text: apellidoMaterno);
    celularController = TextEditingController(text: celular);
    emailController = TextEditingController(text: email);

    // Agrega listeners para detectar cambios en los campos
    nombreController.addListener(_onFieldChanged);
    apellidoPaternoController.addListener(_onFieldChanged);
    apellidoMaternoController.addListener(_onFieldChanged);
    celularController.addListener(_onFieldChanged);
    emailController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    setState(() {
      // Habilita el botón Guardar si alguno de los campos ha cambiado
      hasChanged = nombreController.text != nombre ||
          apellidoPaternoController.text != apellidoPaterno ||
          apellidoMaternoController.text != apellidoMaterno ||
          celularController.text != celular ||
          emailController.text != email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos personales'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableField(label: 'Nombre', controller: nombreController),
            const SizedBox(height: 10),
            _buildEditableField(label: 'Apellido Paterno', controller: apellidoPaternoController),
            const SizedBox(height: 10),
            _buildEditableField(label: 'Apellido Materno (opcional)', controller: apellidoMaternoController, isOptional: true),
            const SizedBox(height: 10),
            _buildInfoField(label: 'Tipo de Documento', value: 'DNI ${widget.dni}'),
            const SizedBox(height: 10),
            _buildEditableField(label: 'Celular', controller: celularController),
            const SizedBox(height: 10),
            _buildEditableField(label: 'Email', controller: emailController),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: hasChanged
                    ? () {
                        _guardarDatos();
                      }
                    : null, // Desactiva el botón si no hay cambios
                style: ElevatedButton.styleFrom(
                  backgroundColor: hasChanged ? Colors.grey[400] : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: const Text('Guardar', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar al login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: const Text('Cerrar sesión', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para construir campos editables
  Widget _buildEditableField({required String label, required TextEditingController controller, bool isOptional = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: isOptional ? 'Ingresa tu $label' : 'Campo obligatorio',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        const Divider(),
      ],
    );
  }

  // Campo de solo lectura
  Widget _buildInfoField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const Divider(),
      ],
    );
  }

  // Función para actualizar los datos
  void _guardarDatos() {
    setState(() {
      // Actualiza los valores locales
      nombre = nombreController.text;
      apellidoPaterno = apellidoPaternoController.text;
      apellidoMaterno = apellidoMaternoController.text;
      celular = celularController.text;
      email = emailController.text;

      hasChanged = false; // Desactiva el botón Guardar tras guardar los cambios
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos guardados correctamente')),
    );
  }

  @override
  void dispose() {
    // Libera los controladores
    nombreController.dispose();
    apellidoPaternoController.dispose();
    apellidoMaternoController.dispose();
    celularController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
