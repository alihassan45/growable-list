import 'package:datamodel/call_data.dart';
import 'package:datamodel/mainmoel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name='';
  String _age='';
   String _contact='';
    String _address='';

  @override
  Widget build(BuildContext context) {
    List <MainModel> meta = users;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Dynamic Data'),
        centerTitle: true,
      ),
      
      body: ListView.builder(
        itemCount: meta.length+1,
        itemBuilder: (BuildContext context, int index) {
          return index==meta.length?
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:(){showDialog(context: context, builder: (context)=>buildDialog(meta));},)
          :Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.red,
                    Colors.orange,
                  ]
                )
              ),
              padding: EdgeInsets.all(15),
             
              child: Column(
                children: [
                  CircleAvatar(
                    //backgroundImage: NetworkImage(meta[index].profilepic),
                    radius: 100,
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white,
                          Colors.purple.withOpacity(0.5),
                        ]
                      ),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    height: 30,
                    
                    child: Row(
                      children: [
                        Text('Name:'),
                        Spacer(),
                        Text(meta[index].name),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.purple.withOpacity(0.5),
                          Colors.white,
                        ]
                      ),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    height: 30,
                   
                    child: Row(
                      children: [
                        Text('Age:'),
                        Spacer(),
                        Text(meta[index].age),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white,
                          Colors.purple.withOpacity(0.5),
                        ]
                      ),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    height: 30,
                   
                    child: Row(
                      children: [
                        Text('Contact:'),
                        Spacer(),
                        Text(meta[index].contact),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.purple.withOpacity(0.5),
                          Colors.white,
                        ]
                      ),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    height: 30,
                   
                    child: Row(
                      children: [
                        Text('Address:'),
                        Spacer(),
                        Text(meta[index].address),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ); 
  }
  AlertDialog buildDialog(List<MainModel> m)=>AlertDialog(
    title: Text('PLEASE ADD DATA'),
    actions: [
      TextButton(
        child: Text('Cancel'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      TextButton(
        child: Text('OK'),
        onPressed: (){
          setState(() {
            if(_name.isNotEmpty&&_age.isNotEmpty&&_contact.isNotEmpty&&_address.isNotEmpty){
              Navigator.pop(context);
              m.add(MainModel(name: _name, age: _age, contact: _contact, address: _address));
              _name='';
              _age='';
              _contact='';
              _address='';

            }
            else{Navigator.pop(context);}
          });
        },
      ),
    ],
    content: Container(
      
      height: 120,
      child: Column(
        children: [
          Container(
            height: 30,
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: 'Enter Your Name'),
              onChanged: (value){
                setState(() {
                  _name=value;
                });
              },
            ),
          ),
          Container(
            height: 30,
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: 'Enter Your Age'),
              onChanged: (value){
                setState(() {
                  _age=value;
                });
              },
            ),
          ),
          Container(
            height: 30,
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: 'Enter Your Contact'),
              onChanged: (value){
                setState(() {
                  _contact=value;
                });
              },
            ),
          ),
          Container(
            height: 30,
            width: 200,
            child: TextField(
              decoration: InputDecoration(hintText: 'Enter Your Address'),
              onChanged: (value){
                setState(() {
                  _address=value;
                });
              },
            ),
          ),
        ],
      ),
    ),
  );
}