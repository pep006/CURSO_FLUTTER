import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nombrealeatorio/counters/counter_bloc.dart';
import 'package:nombrealeatorio/counters/nombre_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => CrearNombrebloc()),
      ],
      child: MaterialApp(
        title: 'Material App', 
        home: CounterPage()
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    final blocnom = context.read<CrearNombrebloc>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('RANDOM NAMES'), 
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            
            // Nombre aleatorio
            BlocBuilder<CrearNombrebloc, String>(
              builder: (context, state) {
                return Text(
                  'NOMBRE ALEATORIO: $state',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                );
              },
            ),

             // Contador con GestureDetector
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return GestureDetector(
                  onTap: () {
                    bloc.add(CounterIncrementPressed());
                  },
                  child: Column(
                    children: [
                      Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                          color: count > 10 ? Colors.red : Colors.black, // ← Aquí el color condicional
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Botón para nombre aleatorio
            FloatingActionButton(
              onPressed: () {
                blocnom.add(CrearNombre());
              },
              child: Text('NOMBRE ALEATORIO'),
              
            ),
          ],
        ),
      ),
    );
  }
}