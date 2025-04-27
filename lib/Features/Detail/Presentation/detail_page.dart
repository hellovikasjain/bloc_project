import 'package:assessment/Features/Detail/Presentation/DetailEvent.dart';
import 'package:assessment/Features/Detail/Presentation/DetailState.dart';
import 'package:assessment/Features/Detail/Presentation/detail_bloc.dart';
import 'package:assessment/Features/Home/Data/dog_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailPage extends StatelessWidget {
  DogListModal dogListModal;
   DetailPage({super.key, required this.dogListModal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${dogListModal.id}"),
      ),
      body: SafeArea(child: BlocConsumer<DetailBoc,DetailState>(

        listener: (context,state){
          if(state is AdoptIsCompleted){
            Navigator.pop(context);
          }
        },

        builder: (context,state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width:  MediaQuery.of(context).size.width,
            ),
            Hero(
              tag: "${dogListModal.id}",
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(dogListModal.url.toString()),fit: BoxFit.fill)
                ),

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Name: ${dogListModal.name}"),
            Text("Age: ${dogListModal.age}"),
            Text("Price: ${dogListModal.price}"),

            const SizedBox(
              height: 20,
            ),


            GestureDetector(
              onTap: (){
                dogListModal.canAdopt!? context.read<DetailBoc>().add(AdoptEvent(dogListModal)): debugPrint("Cant Adopt");

              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.width*0.1,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:state is AdoptIsLoading?const CircularProgressIndicator() : const Text("Adopt Me"),
              ),
            )

          ],
        );
      },)),
    );
  }
}
