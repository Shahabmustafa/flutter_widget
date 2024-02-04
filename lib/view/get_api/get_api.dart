import 'package:flutter/material.dart';
import 'package:flutter_widgets/db/get_api_controller.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GetApiController().fetchData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                return ListTile(
                  leading: Text(snapshot.data![index].id.toString()),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].body),
                  trailing: Text(snapshot.data![index].postId.toString()),

                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
