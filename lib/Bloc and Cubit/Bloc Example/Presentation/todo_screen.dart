import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_bloc.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_event.dart';
import 'package:assessment/Bloc%20and%20Cubit/Bloc%20Example/Presentation/todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    WidgetsBinding.instance.addPostFrameCallback((_){
      final currentState= context.read<TodoBloc>().state;
      if(currentState is InitialTodoState){
        context.read<TodoBloc>().add(TodoFetchEvent());
      }
    });
    return  Scaffold(

      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: BlocConsumer<TodoBloc,TodoState>(listener: (context,state){},
            builder: (context,state){



            return  state is InitialTodoState?const Text("No Data Found"): state is TodoLoadingState? const CircularProgressIndicator(): ListView.builder(
                itemCount: (state as TodoFetchedState).data.length,
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
        context.read<TodoBloc>().add(TodoFetchEvent());
      },child:const Icon(CupertinoIcons.arrow_2_circlepath),),

    );
  }
}
