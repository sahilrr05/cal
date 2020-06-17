import 'package:flutter/material.dart';

class Homep extends StatefulWidget {
  @override
  _HomepState createState() => _HomepState();
}

String textdisplay = "";
int firstno = 0;
int secoundno = 0;
String result = '';
String opertation = "";

class _HomepState extends State<Homep> {
  void btnclick(String btnvalu) {
    try {
      if (btnvalu == "C") {
        firstno = 0;
        secoundno = 0;
        result = "";
        textdisplay = "";
        opertation = "";
      } else if (btnvalu == "+" ||
          btnvalu == "-" ||
          btnvalu == "*" ||
          btnvalu == "/") {
        firstno = int.parse(textdisplay);
        result = "";
        opertation = btnvalu;
      } else if (btnvalu == "=") {
        secoundno = int.parse(textdisplay);
        {
          try {
            if (opertation == "+") {
              result = (firstno + secoundno).toString();
            }
            if (opertation == "-") {
              result = (firstno - secoundno).toString();
            }
            if (opertation == "~/") {
              result = (firstno / secoundno).toString();
            }
            if (opertation == "*") {
              result = (firstno * secoundno).toString();
            }
          } catch (Exception) {}
        }
      } else {
        result = int.parse(textdisplay + btnvalu).toString();
      }
    } catch (Excetion) {}

    setState(() {
      textdisplay = result;
    });
  }

  Widget buttonn(String btnvalu) {
    return  MaterialButton(
      height: 10.0,
      minWidth: 10.0,
      onPressed: () => btnclick(btnvalu),
      child: Text(
        '$btnvalu',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.white60,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.205,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 35.0),
            child: Text(
              '$firstno $opertation $secoundno',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                '$textdisplay',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.3,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                NeumorphicContainer(
                  child: buttonn('C'),
                ),
                SizedBox(
                  width: 25.0,
                ),
                NeumorphicContainer(
                  child: buttonn('='),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NeumorphicContainer(
                child: buttonn('7'),
              ),
              NeumorphicContainer(
                child: buttonn('8'),
              ),NeumorphicContainer(
                child: buttonn('9'),
              ),
              NeumorphicContainer(
                child: buttonn('/'),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NeumorphicContainer(
                child: buttonn('4'),
              ),
              NeumorphicContainer(
                child: buttonn('5'),
              ),NeumorphicContainer(
                child: buttonn('6'),
              ),
              NeumorphicContainer(
                child: buttonn('*'),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NeumorphicContainer(
                child: buttonn('1'),
              ),
              NeumorphicContainer(
                child: buttonn('2'),
              ),NeumorphicContainer(
                child: buttonn('3'),
              ),
              NeumorphicContainer(
                child: buttonn('-'),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NeumorphicContainer(
                child: buttonn('00'),
              ),
              NeumorphicContainer(
                child: buttonn('0'),
              ),NeumorphicContainer(
                child: buttonn('.'),
              ),
              NeumorphicContainer(
                child: buttonn('+'),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 9.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : color.mix(Colors.black, .1),
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
                color.mix(Colors.white, _isPressed ? .2 : .5),
              ],
              stops: [
                0.0,
                .3,
                .6,
                1.0,
              ]),
          boxShadow: _isPressed
              ? null
              : [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: -widget.blurOffset,
              color: color.mix(Colors.white, .6),
            ),
            BoxShadow(
              blurRadius: widget.bevel,
              offset: widget.blurOffset,
              color: color.mix(Colors.black, .3),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
