import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/model/contact.dart';

import '../db/db.dart';

class DraggableHomePage extends StatefulWidget {
  const DraggableHomePage({Key? key}) : super(key: key);

  @override
  State<DraggableHomePage> createState() => _DraggableHomePageState();
}

class _DraggableHomePageState extends State<DraggableHomePage> {
  DBHelper? dbHelper;
  late Future<List<ContactModel>> contactModel;

  final name = TextEditingController();
  final number = TextEditingController();
  final id = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }
  loadData()async{
    contactModel =  dbHelper!.getCartListWithUserId();
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context) * 1;
    return DraggableHome(
      title: Text("Phone",style: TextStyle(color: Colors.white),),
      centerTitle: false,
      actions: const [
        Icon(Icons.add,color: Colors.white,),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.search,color: Colors.white,),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_vert,color: Colors.white,),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(context),
      body: [
        Column(
          children: [
            SizedBox(
              height: size.height * 1,
              child: FutureBuilder(
                  future: contactModel,
                  builder: (context,AsyncSnapshot<List<ContactModel>> snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: (){
                                dbHelper!.updateQuantity(
                                 ContactModel(
                                     name: "Shahab",
                                     number: "03112445554",
                                     avatar: "S",
                                     email: "shahab@gmail.com"
                                 ),
                                );
                                setState(() {
                                  contactModel = dbHelper!.getCartListWithUserId();
                                });
                              },
                              child: Dismissible(
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                  child: Icon(Icons.delete),
                                ),
                                onDismissed: (DismissDirection direction)async{
                                  setState(() {
                                    dbHelper!.deleteTableContent(snapshot.data![index].id!);
                                    contactModel = dbHelper!.getCartListWithUserId();
                                    snapshot.data!.remove(snapshot.data![index]);
                                  });
                                },
                                key: ValueKey<int>(snapshot.data![index].id!),
                                child: Card(
                                  child: ListTile(
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Center(child: Text(snapshot.data![index].avatar,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ),
                                    title: Text(snapshot.data![index].name),
                                    subtitle: Text(snapshot.data![index].number),
                                  ),
                                ),
                              ),
                            );
                          });
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ],
      fullyStretchable: true,
      backgroundColor: Colors.white,
      appBarColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: id,
                        decoration: InputDecoration(
                          hintText: "First Name Alphabit",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: number,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){
                          dbHelper!.insert(
                            ContactModel(
                                name: name.text,
                                number: number.text,
                                avatar: id.text,
                                email: "shahabmustafa57@gmail.com"
                            ),
                          ).then((value){
                            print("add Data");
                            setState(() {
                              contactModel = dbHelper!.getCartListWithUserId();
                            });
                            Navigator.pop(context);
                          }).onError((error, stackTrace){
                            print("error ${error}");
                          });
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                ),
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Row headerBottomBarWidget(BuildContext context){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.add,color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Icon(Icons.search,color: Colors.white,),
      SizedBox(
        width: 10,
      ),
      Icon(Icons.more_vert,color: Colors.white,),
    ],
  );
}

Widget headerWidget(BuildContext context) {
  return Container(
    color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Phone",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
        const Text("9 Contact with Phone Number",style: TextStyle(color: Colors.white),)
      ],
    ),
  );
}