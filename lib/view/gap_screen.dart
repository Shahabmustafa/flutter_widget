import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GapPage extends StatefulWidget {
  const GapPage({Key? key}) : super(key: key);

  @override
  State<GapPage> createState() => _GapPageState();
}

class _GapPageState extends State<GapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gap"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Cold Drinks"),
              Text("Types"),
            ],
          ),
          Gap(10),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/474x/45/1d/df/451ddf96e958c635948cd88c29892565.jpg"),
              ),
              title: Text("CocaCola"),
            ),
          ),
          Gap(10),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/474x/23/bd/fd/23bdfd20ff107414a12bc7e1e2646ca6.jpg"),
              ),
              title: Text("Pepsi"),
            ),
          ),
          Gap(10),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/474x/6b/03/99/6b0399446542ea71c929940aed26e7a1.jpg"),
              ),
              title: Text("Dew"),
            ),
          ),
          Gap(10),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/474x/b2/78/c9/b278c9eee7bfd4007a6bb0d11facf47c.jpg"),
              ),
              title: Text("RedBull"),
            ),
          ),
        ],
      ),
    );
  }
}
