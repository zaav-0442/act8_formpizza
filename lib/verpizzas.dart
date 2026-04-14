import 'package:flutter/material.dart';
import 'diccionario_pizzas.dart';

class PantallaVerPizzas extends StatefulWidget {
  const PantallaVerPizzas({super.key});

  @override
  State<PantallaVerPizzas> createState() => _PantallaVerPizzasState();
}

class _PantallaVerPizzasState extends State<PantallaVerPizzas> {
  @override
  Widget build(BuildContext context) {
    final registros = DatosPizza.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pizzas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color(0xFFFFF8E1),
        child: registros.isEmpty
            ? const Center(
                child: Text(
                  'Aún no hay pizzas registradas.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: registros.length,
                itemBuilder: (context, index) {
                  final pizza = registros[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Text(
                          pizza.id.toString(),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        pizza.nombre,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text('Ingredientes: ${pizza.ingredientes}'),
                          const SizedBox(height: 2),
                          Text('Precio: \$${pizza.precio.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      trailing: const Icon(Icons.local_pizza, color: Colors.orange),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
