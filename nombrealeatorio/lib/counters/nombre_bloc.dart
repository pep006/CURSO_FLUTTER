

import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nombrealeatorio/counters/counter_bloc.dart';


part 'nombre_event.dart';


class CrearNombrebloc extends Bloc<NombreEvent, String> {
  CrearNombrebloc() : super('no-name') {


 on<CrearNombre>(_nomaleatorio);

  }



   FutureOr<void> _nomaleatorio(
    CrearNombre event,
    Emitter<String> emit,
  ) {
   
      final faker = Faker();
  
  String nombreCompleto = faker.internet.userName();
  print('nombre: $nombreCompleto');
  
  // Emitir el nuevo estado con el nombre generado
  emit(nombreCompleto);

     
    
  }
}