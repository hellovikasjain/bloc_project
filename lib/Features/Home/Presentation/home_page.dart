import 'package:assessment/Features/Detail/Presentation/detail_page.dart';
import 'package:assessment/Features/History/Presentation/history_page.dart';
import 'package:assessment/Features/Home/Presentation/home_page_bloc.dart';
import 'package:assessment/Features/Home/Presentation/home_page_event.dart';
import 'package:assessment/Features/Home/Presentation/home_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../MethodChennal/battery_native_code.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int a =0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent && a<=15) {
      context.read<HomePageBloc>().add(FetchDataEvent(a));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dogs List"),

        actions: [

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HistoryPage()));
            },
            child:const Icon(Icons.history),
          )

        ],
      ),

      body: SafeArea(child: BlocConsumer<HomePageBloc,HomePageState>(
        listener: (context,state){},
        builder: (context,state){
          return Column(
            children: [
             state is LoadedState?state.dogData.isNotEmpty? Expanded(child: ListView.builder(
               controller: _scrollController,
               itemCount: state.len,
                  itemBuilder: (context,item){
                 a=state.len;
                  return Padding(padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(dogListModal: state.dogData[item])));
                      },
                      child: Row(
                        children: [
                          Hero(
                            tag: "${state.dogData[item].id}",
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(state.dogData[item].url.toString()),fit: BoxFit.fill)
                              ),
                            ),
                          ),

                        const  SizedBox(
                            width: 10,
                          ),

                          Text("ID- ${state.dogData[item].id}"),

                         const Spacer(),



                         state.dogData[item].canAdopt!? const Text("Can Adopt",style: TextStyle(
                           color: Colors.green
                         ),):const Text("Adopted",style: TextStyle(
                           color: Colors.red
                         ),),
                        ],
                      ),
                    ),
                  );
              })): const Center(
               child:  CircularProgressIndicator(),
             ):const SizedBox.shrink(),

              state is LoadingState? const Center(
                  child: CircularProgressIndicator()):const SizedBox.shrink()
            ],
          );
        }, )),

       floatingActionButton: Column(
         mainAxisAlignment: MainAxisAlignment.end,

         children: [
           FloatingActionButton(
             heroTag: 'unique_tag_2',
             onPressed: ()=>context.read<HomePageBloc>().add(FetchDataEvent(a)),
           child:const  Icon(CupertinoIcons.arrow_2_circlepath),),

           const SizedBox(
             height: 30,
           ),

           FloatingActionButton(
             heroTag: 'unique_tag_1',
             onPressed:  ()=>Navigator.push(context,MaterialPageRoute(builder:  (context)=>BatteryLevel())),
             child:const  Icon(CupertinoIcons.battery_0),),
         ],
       ),
    );
  }
}
