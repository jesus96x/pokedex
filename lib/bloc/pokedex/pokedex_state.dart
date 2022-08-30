part of 'pokedex_bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState();
}

class PokedexInitial extends PokedexState {
  @override
  List<Object> get props => [];
}
