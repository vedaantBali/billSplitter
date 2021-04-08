import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Test Debug")),
          IconButton(icon: Icon(Icons.alarm), onPressed: tapButton),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FAB pressed"),
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("First")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Second")),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_sharp), title: Text("Third")),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()

            // InkWell(
            //   child: Text(
            //     "Tap Me!",
            //     style: TextStyle(fontSize: 23.4),
            //   ),
            //   onTap: () => debugPrint("Tapped"),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello snackbar"),
          backgroundColor: Colors.deepOrange,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}





tapButton() {
  debugPrint("AlarmPressed");
}

class MovieListView extends StatelessWidget {
  final List movies = [
    "Harry Potter",
    "The Avengers",
    "The Wolf of Wall Street",
    "Interstellar",
    "Gravity",
    "Game of Thrones",
    "Cloudy With a Chance of Meatballs",
    "Need for Speed",
    "Fast and Furious",
    "San Andreas",
    "2012",
    "Monsters, Inc.",
    "Chhichhore",
    "Deadpool",
    "College Romance",
    "Please Find Attached",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade500,
      ),
      backgroundColor: Colors.blueGrey.shade200,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2.5,
              margin: EdgeInsets.all(7.5),
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text("h"),
                  ),
                ),
                trailing: Text("..."),
                title: Text(movies[index]),
                subtitle: Text("Sub"),
                // onTap: () => debugPrint("Movie Name: ${movies.elementAt(index)}"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MovieListViewDetails(movieName: movies[index],)
                  )
                  );
                },
              ),
            );
          }),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {


  final String movieName;

  const MovieListViewDetails({Key key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade500,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Go Back to $movieName"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic),
      )),
    );

    // return Center(child: Text("Hello Flutter",
    //   textDirection: TextDirection.ltr,),
    // );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Vedaant Bali",
            style: TextStyle(
              fontSize: 20.9,
              color: Colors.white,
            ),
          ),
          Text("vedaantbali@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("Contact Card")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  var _index = 0;

  List quotes = [
    "Life isn't about getting and having, it's about giving and being.",
    "Whatever the mind of man can conceive and believe, it can achieve.",
    "Strive not for success, but rather to be of value.",
    "You miss 100% of the shots you don't take.",
    "The most difficult thing is the decision to act, the rest is mere tenacity.",
    "Every strike brings me closer to the next home run."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        //color: Colors.amberAccent.shade200,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                      child: Text(
                        quotes[_index % quotes.length],
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontStyle: FontStyle.italic,
                            fontSize: 14),
                      ),
                    )),
              ),
            ),
            Divider(
              thickness: 1.2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextButton.icon(
                  onPressed: _showQuote,
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.amber.shade300,
                      textStyle:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                  icon: Icon(Icons.wb_sunny),
                  label: Text("Inspire Me!")),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCtr = 1;
  double _billAmt = 0.0;
  double _tipAmt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100.withOpacity(0.3),
                  border: Border.all(color: Colors.lightBlue.shade100),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue.shade500),
                    ),
                    Divider(
                      thickness: 1.2,
                      color: Colors.transparent,
                    ),
                    Text(
                      "\$${_tipAmt / _personCtr}",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade500),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.blue.shade500),
                    decoration: InputDecoration(
                        hintText: "Bill Amount",
                        //prefixText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money_sharp)),
                    onChanged: (String value) {
                      try {
                        _billAmt = double.parse(value);
                      } catch (exception) {
                        _billAmt = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  if (_personCtr > 1) {
                                    _personCtr--;
                                  } else {}
                                },
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color:
                                    Colors.lightBlue.shade100.withOpacity(0.3),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.blue.shade500),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCtr",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.blue.shade500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCtr++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color:
                                    Colors.lightBlue.shade100.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.blue.shade500,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(12.0),
                            child: Text(
                              "\$${_billAmt * _tipPercentage / 100}",
                              style: TextStyle(
                                  color: Colors.blue.shade500,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue.shade500),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 20,
                          activeColor: Colors.blue.shade500,
                          inactiveColor: Colors.grey.withOpacity(0.25),
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                              _tipAmt =
                                  _billAmt * _tipPercentage / 100 + _billAmt;
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
