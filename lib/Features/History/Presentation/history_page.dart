import 'package:assessment/Features/History/Presentation/history_bloc.dart';
import 'package:assessment/Features/History/Presentation/history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocConsumer<HistoryBloc,HistoryState>(listener: (context,state){},
        builder: (context,state){
       return  state is HistoryLoading? const Center(
         child: CircularProgressIndicator(),
       ):state is HistoryLoaded? ListView.builder(

         itemCount: state.data.length,
           itemBuilder: (context,item){
         return Padding(padding:const EdgeInsets.all(10),

           child: Row(
             children: [
               Container(
                 height: 100,
                 width: 100,
                 decoration: BoxDecoration(
                     image: DecorationImage(image: NetworkImage(state.data[item]["url"].toString()),fit: BoxFit.fill)
                 ),
               ),

               const SizedBox(
                 width: 10,
               ),


               Column(
                 children: [
                   Text("${state.data[item]["name"]}"),

                   const SizedBox(
                     height: 10,
                   ),

                   Container(child: Text(" ${state.data[item]["date"]}"))
                 ],
               )


             ],
           ),

         );
       }): const SizedBox.shrink();
      }, )),

    );
  }
}
