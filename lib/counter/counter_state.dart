part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}


class AddState extends CounterState{}
class MinusState extends CounterState{}