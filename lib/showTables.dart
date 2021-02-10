import 'package:flutter/material.dart';

class ShowTables extends StatelessWidget {
  List<String> A1=[];
  List<String> A2=[];
  List<String> A3=[];
  ShowTables(this.A1,this.A2,this.A3);
  var x=[];
  var y=[];
  var finalTable=[];
  var temp=[];
  divide()
  {
    var finali=[];
    for(int i=0;i<A1.length;i++)
    {
      for(int j=0;j<A1.length;j++)
      {
        if(A1[i]==A1[j])
        {
          x.add(A2[j]);
          y.add(A1[j]);
        }
      }
      temp.addAll(A3);
      for(int p=0;p<x.length;p++)
      {
        if(temp.contains(x[p]))
        {
          temp.remove(x[p]);
        }
      }
      if(temp.isEmpty)
      {
        finali.add(y[0]);
      }
      x=[];
      y=[];
      temp=[];
    }
    finali = finali.toSet().toList();
    return finali;
  }

  @override
  Widget build(BuildContext context) {
    finalTable=divide();
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            SizedBox(height: 10,),
            Text("After dividing",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 150,right: 150),
              physics: NeverScrollableScrollPhysics(),
              itemCount: finalTable.length,
              itemBuilder: (context,index){
                return Container(
                  alignment: Alignment.center,
                  child: Text(finalTable[index],style: TextStyle(fontSize: 20,),),
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
      ),
    );
  }
}