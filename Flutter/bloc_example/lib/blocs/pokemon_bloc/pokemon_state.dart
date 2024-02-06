part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonLoading extends PokemonState {}

final class PokemonFetched extends PokemonState {}
