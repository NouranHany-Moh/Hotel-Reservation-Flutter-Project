
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import'main.dart';
import 'CustomAppBar.dart';

class Reservation extends StatefulWidget {

  //const Reservation({Key? key,this.value}) : super(key: key);
DateTime checkin;
DateTime checkout;
double num_adults;
double num_children;
List<String>?  Extras;
String view;

Reservation({Key ?key,required this.checkin,required this.checkout,required this.num_adults,required this.num_children,required this.Extras,required this.view}):super(key: key);
  @override
  State<Reservation> createState() => _ReservationState();
}

class MyItem {
  MyItem(
      {this.isExpanded_single: false,
      this.isExpanded_double: false,
      this.isExpanded_suite: false,
      required this.header,
      required this.footer});

  bool isExpanded_single;
  bool isExpanded_double;
  bool isExpanded_suite;
  final String header;
  final String footer;
}

class _ReservationState extends State<Reservation> {
  List<MyItem> _items = <MyItem>[
    MyItem(header: "Header1", footer: "Footer1"),

  ];



  void showDialogBox(BuildContext Context)
  {

     var alertDialog=AlertDialog(
      title: Text("Are You Sure You Want to Proceed in Checking in?"),
      content: Text(
        """This is a confirmation message that
        you agree on all data you entered:
        Check-in Date:${widget.checkin.year} - ${widget.checkin.month} - ${widget.checkin.day}
        Check-out Date:${widget.checkout.year} - ${widget.checkout.month} - ${widget.checkout.day}
        Number of Adults:${widget.num_adults}
        Number of Children:${widget.num_children}
        Extras:${widget.Extras.toString()}
        View:${widget.view}
        Chosen Room:${chosenRoom().toString()}
        """
      ),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          print('Thanks');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("your form has been successfully submitted"),
            duration: Duration(seconds: 3),
          ));
        }, child: Text('Confirm')),

        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          print('Thanks');
        }, child: Text('Discard')),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }

  bool sval_single = false;
  bool sval_double = false;
  bool sval_suite = false;

  void _onChange_single(bool val) {
    setState(() {
      sval_single = val;
    });
  }

  void _onChange_double(bool val) {
    setState(() {
      sval_double = val;
    });
  }

  void _onChange_suite(bool val) {
    setState(() {
      sval_suite = val;
    });
  }

String chosenRoom(){
  String chosenroom="HHH";
    if( sval_single==true)
      {
        chosenroom="Single Room";
      }
  else if( sval_double=true)
  {
    chosenroom="Double Room";
  }
  else if( sval_suite==true)
  {
    chosenroom="Suite";
  }

    return chosenroom;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CustomAppBar(),preferredSize: Size.fromHeight(100)),
      body: ListView(
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded_single =
                    !_items[index].isExpanded_single;
              });
            },
            children: _items.map<ExpansionPanel>((MyItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Row(children: [
                    Image.asset(
                      "images/single_room.jfif",
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Single Room",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                          fontSize: 17),
                    ),
                    Switch(
                      value: sval_single,
                      onChanged: _onChange_single,
                      activeColor: Colors.cyan,
                    ),
                  ]);
                },
                body: Row(children: [
                  RatingBar.builder(
                    itemSize: 20,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    initialRating: 4,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  ),
                  Text("A room assigned to one Person",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))
                ]),
                isExpanded: item.isExpanded_single,
              );
            }).toList(),
          ),
//double
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded_double =
                    !_items[index].isExpanded_double;
              });
            },
            children: _items.map<ExpansionPanel>((MyItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Row(children: [
                    Image.asset(
                      "images/DoubleRoom.jfif",
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Double Room",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                          fontSize: 17),
                    ),
                    Switch(
                      value: sval_double,
                      onChanged: _onChange_double,
                      activeColor: Colors.cyan,
                    ),
                  ]);
                },
                body: Row(children: [
                  RatingBar.builder(
                    itemSize: 20,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    initialRating: 4,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  ),
                  Text("""""A room assigned to two people.May
                     have one or two beds""",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))
                ]),
                isExpanded: item.isExpanded_double,
              );
            }).toList(),
          ),

          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _items[index].isExpanded_suite =
                    !_items[index].isExpanded_suite;
              });
            },
            children: _items.map<ExpansionPanel>((MyItem item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Row(children: [
                    Image.asset(
                      "images/suite.jpg",
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Suite Room",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                          fontSize: 17),
                    ),
                    Switch(
                      value: sval_suite,
                      onChanged: _onChange_suite,
                      activeColor: Colors.cyan,
                    ),
                  ]);
                },
                body: Row(children: [
                  RatingBar.builder(
                    itemSize: 20,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    initialRating: 5,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  ),
                  Text("""""A room with one or two bedrooms"
                  and a seperate living space""",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontSize: 17))
                ]),
                isExpanded: item.isExpanded_suite,
              );
            }).toList(),
          ),
          Container(
              child: Align(
                  child: SizedBox(
            child: ElevatedButton(
                onPressed: () {
                  showDialogBox(context);

                },
                child: Text("Book Now !"),
                style: ElevatedButton.styleFrom(primary: Colors.cyan)),
            width: 200,
          )))
        ],
      ),
    );
  }
}
