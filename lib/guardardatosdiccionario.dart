import 'clase_pizza.dart';
import 'diccionario_pizzas.dart';

class AgenteGuardarDatos {
  static int _siguienteId = 1;

  static void guardarPizza(String nombre, String ingredientes, double precio) {
    if (DatosPizza.isNotEmpty) {
      _siguienteId = DatosPizza.keys.reduce((a, b) => a > b ? a : b) + 1;
    }
    
    Pizza nuevaPizza = Pizza(
      id: _siguienteId,
      nombre: nombre,
      ingredientes: ingredientes,
      precio: precio,
    );
    
    DatosPizza[_siguienteId] = nuevaPizza;
    print("Pizza guardada con ID: $_siguienteId");
  }
}
