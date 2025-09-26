import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

final String nombreCompleto = '';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(_onincrementt);
  }

  FutureOr<void> _onincrementt(
    CounterIncrementPressed event,
    Emitter<int> emit,
  ) {
    if (state < 15) {
      emit(state + 1);
    }if(state ==15){
      emit(state -15);

    }
  }
}
