import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class PantallaCaptura extends StatefulWidget {
  const PantallaCaptura({super.key});

  @override
  State<PantallaCaptura> createState() => _PantallaCapturaState();
}

class _PantallaCapturaState extends State<PantallaCaptura> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _ingredientesCtrl = TextEditingController();
  final TextEditingController _precioCtrl = TextEditingController();

  void _guardarFormulario() {
    if (_formKey.currentState!.validate()) {
      AgenteGuardarDatos.guardarPizza(
        _nombreCtrl.text,
        _ingredientesCtrl.text,
        double.parse(_precioCtrl.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Datos de la pizza guardados exitosamente!'),
          backgroundColor: Colors.green,
        ),
      );
      _nombreCtrl.clear();
      _ingredientesCtrl.clear();
      _precioCtrl.clear();
      
      // Opcional: Redirigir a inicio después de un corto tiempo o manualmente
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Pizza', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color(0xFFFFF8E1),
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Registrar Nueva Pizza',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _nombreCtrl,
                        decoration: InputDecoration(
                          labelText: 'Nombre de la Pizza',
                          prefixIcon: const Icon(Icons.local_pizza, color: Colors.orange),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa un nombre.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _ingredientesCtrl,
                        decoration: InputDecoration(
                          labelText: 'Ingredientes Principales',
                          prefixIcon: const Icon(Icons.fastfood, color: Colors.orange),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa los ingredientes.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _precioCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Precio (\$)',
                          prefixIcon: const Icon(Icons.attach_money, color: Colors.orange),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa el precio.';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Ingresa un valor numérico válido.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            elevation: 5,
                          ),
                          onPressed: _guardarFormulario,
                          child: const Text('Guardar Datos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
