import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  int radioValue=0;
  double _finalResult=0.0;
  String formattedText="";
  double calculateWeight(String value,double multiplier){
    if(int.parse(value).toString().isNotEmpty && int.parse(value)>0){
      return int.parse(value)*multiplier;
    }else{
      return -1;
    }
  }
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue=value;
      switch(radioValue){
        case 0:
          _finalResult=calculateWeight(_weightController.text,0.06);
          if(_finalResult<0)formattedText="Weight must be greater than 0";
          else formattedText="Your weight on Pluto is ${_finalResult.toStringAsFixed(1)} lbs";
          break;
        case 1:
          _finalResult=calculateWeight(_weightController.text, .38);
          if(_finalResult<0)formattedText="Weight must be greater than 0";
          else formattedText="Your weight on Mars is ${_finalResult.toStringAsFixed(1)} lbs";
          break;
        case 2:
          _finalResult=calculateWeight(_weightController.text, .91);
          if(_finalResult<0)formattedText="Weight must be greater than 0";
          else formattedText="Your weight on Venus is ${_finalResult.toStringAsFixed(1)} lbs";
          break;
      }
    });
  }
  final TextEditingController _weightController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Weight on planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset('images/planet.png',
              height: 133.0,width: 200.0,
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[

                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Your Weight on earth',
                      hintText: 'In pounds',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(5.0)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Radio(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),

                      Text(
                        "Pluto",
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),

                      Radio(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),

                      Text(
                        "Mars",
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),

                      Radio(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),

                      Text(
                        "Venus",
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),

                    ],
                  ),

                  Padding(padding: EdgeInsets.all(15.6),),

                  Text(
                    _weightController.text.isNotEmpty?"Please enter weight": formattedText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}