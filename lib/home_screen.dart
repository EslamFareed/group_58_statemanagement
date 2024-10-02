import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_58_statemanagement/counter/counter_cubit.dart';
import 'package:group_58_statemanagement/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // setState(() {
                //   counter++;
                // });
                CounterCubit.get(context).add();
              },
              icon: const Icon(Icons.add),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                print(state);
                return Text(
                  "${CounterCubit.get(context).counter}",
                  style: TextStyle(
                      fontSize: 50,
                      color: state is AddState ? Colors.green : Colors.red),
                );
              },
            ),
            IconButton(
              onPressed: () {
                // setState(() {
                //   counter--;
                // });
                CounterCubit.get(context).minus();
              },
              icon: const Icon(Icons.minimize),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Switch(
                  value: HomeCubit.get(context).isDark,
                  onChanged: (value) {
                    HomeCubit.get(context).changeMode();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
