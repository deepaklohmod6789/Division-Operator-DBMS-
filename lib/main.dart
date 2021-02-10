import 'package:division/showTables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AcceptInput(),
  ));
}

class AcceptInput extends StatefulWidget {
  @override
  _AcceptInputState createState() => _AcceptInputState();
}

class _AcceptInputState extends State<AcceptInput> {
  List<String> A1=[];
  List<String> A2=[];
  List<String> A3=[];
  TextEditingController a1EditingController=TextEditingController();
  TextEditingController a2EditingController=TextEditingController();
  TextEditingController a3EditingController=TextEditingController();
  bool firstTable=true;

  firstTableWidget()
  {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text("Table 1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: a1EditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0),
                        ),
                    ),
                    hintText: "Column 1",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent[400]),
                        borderRadius: BorderRadius.all(Radius.circular(18.0),)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Expanded(
                child: TextFormField(
                  controller: a2EditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18.0),
                        ),
                    ),
                    hintText: "Column 2",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent[400]),
                        borderRadius: BorderRadius.all(Radius.circular(18.0),)
                    ),
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text("Add"),
            onPressed: (){
              setState(() {
                A1.add(a1EditingController.text);
                A2.add(a2EditingController.text);
                a1EditingController.clear();
                a2EditingController.clear();
              });
            },
          ),
          SizedBox(height: 10,),
          Text("Table1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: A1.length,
            itemBuilder: (context,index){
              return Padding(
                padding: EdgeInsets.only(left: 150,right: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(A1[index],style: TextStyle(fontSize: 20,),),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(A2[index],style: TextStyle(fontSize: 20,),),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  secondTableWidget()
  {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text("Table 2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Padding(
            padding: EdgeInsets.only(left: 100,right: 100),
            child: TextFormField(
              controller: a3EditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0),
                  ),
                ),
                hintText: "Column 1",
                hintStyle: TextStyle(color: Colors.grey[700]),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent[400]),
                    borderRadius: BorderRadius.all(Radius.circular(18.0),)
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: (){
             setState(() {
               A3.add(a3EditingController.text);
               a3EditingController.clear();
             });
            },
            child: Text("Save"),
          ),
          SizedBox(height: 10,),
          Text("Table 2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          ListView.builder(
            padding: EdgeInsets.only(left: 150,right: 150),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: A3.length,
            itemBuilder: (context,index){
              return Container(
                alignment: Alignment.center,
                child: Text(A3[index],style: TextStyle(fontSize: 20),),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black87,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accept input"),centerTitle: true,),
      body: firstTable?firstTableWidget():secondTableWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          firstTable?setState(() {
            firstTable=false;
          }):Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowTables(A1,A2,A3)));
        },
        child: Text(firstTable?"Save":"Divide"),
      ),
    );
  }
}