import 'package:assessment/Bloc%20and%20Cubit/Cubit/Presentation/todo_cubit.dart';
import 'package:assessment/Bloc%20and%20Cubit/Cubit/Presentation/todo_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubitScreen extends StatelessWidget {
  const TodoCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: BlocConsumer<TodoCubit,TodoCubitState>(listener: (context,state){},
            builder: (context,state){



              return  state is InitialTodoCubitState?const Text("No Data Found"): state is TodoCubitLoadingState? const CircularProgressIndicator(): ListView.builder(
                  itemCount: (state as TodoCubitFetchedState).data.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,item){
                    return Row(
                      children: [
                        const SizedBox(width: 20,),

                        Text(state.data[item].id.toString())
                      ],
                    );
                  });
            } ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<TodoCubit>().fetchData();
      },child:const Icon(CupertinoIcons.arrow_2_circlepath),),

    );
  }
}
