import 'package:flutter/material.dart';

import 'package:shopping_cart/screens/menu.dart';

class MenuAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarContent(),
      ),
      color: Theme.of(context).dialogBackgroundColor,
      notchMargin: 6.0,
      shape: CircularNotchedRectangle(),
    );
  }
}

class BarContent extends StatefulWidget {
  const BarContent({
    Key key,
  }) : super(key: key);

  @override
  BarContentState createState() {
    return new BarContentState();
  }
}

class BarContentState extends State<BarContent> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        TextStyle(fontSize: 24.0, color: Theme.of(context).primaryColorDark);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text('Total: ', style: style),
        StreamBuilder(
          stream: InheritedMenuScreen.of(context).bloc.itemCount,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              _controller
                ..reset()
                ..forward();
            }

            return FadeTransition(
              opacity: _controller,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  StreamBuilder(
                    stream: InheritedMenuScreen.of(context).bloc.totalPrice,
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '${snapshot.data} ',
                          style: style,
                        );
                      }
                      return Text(
                        '\$0.00 ',
                        style: style,
                      );
                    },
                  ),
                  StreamBuilder(
                    stream: InheritedMenuScreen.of(context).bloc.itemCount,
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.hasData) {
                        String itemPluralized =
                            snapshot.data == 1 ? 'item' : 'items';
                        return Text(
                          '(${snapshot.data} $itemPluralized)',
                          style: style.copyWith(fontSize: 12.0),
                        );
                      }
                      return Text('', style: style);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
